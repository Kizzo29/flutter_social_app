import 'dart:async';
import 'package:social_media/Models/message_group.dart';
import 'package:social_media/Models/user.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:social_media/Services/message_group/message_group_contract.dart';
import 'package:social_media/Services/user/user_contract.dart';

class MessageGroupService implements IMessageGroup {
  late Connection _connection;
  late RethinkDb r;
  late IUserService _userService;

  final _controller = StreamController<MessageGroup>.broadcast();
  StreamSubscription? _subscription;

  MessageGroupService(this._connection, this.r, this._userService);

  @override
  dispose() {
    _controller.close();
    _subscription?.cancel();
  }

  @override
  Future<MessageGroup> create(String myId, MessageGroup chatRoom) async {
    var room = chatRoom.toJson();
    room['admin'] = myId;
    if (room.id != null) room['id'] = chatRoom.id;
    final chatroom = await r.table('groups').insert(
        room, {'conflict': 'update', 'return_changes': true}).run(_connection);
    return MessageGroup.fromJson(chatroom['changes'].first['new_val']);
  }

  @override
  Future<void> remove(String userId, MessageGroup room) async {
    var group = await r
        .table('groups')
        .get(room.id)
        .filter({'id': room.id}).run(_connection);
    final found_group = MessageGroup.fromJson(group);
    found_group.members.remove(userId);
  }

  @override
  Future<void> addMember(String userId, MessageGroup room) async {
    var group = await r
        .table('groups')
        .get(room.id)
        .filter({'id': room.id}).run(_connection);
    final found_group = MessageGroup.fromJson(group);
    found_group.members.add(userId);
  }

  @override
  Future<List<MessageGroup>> fetch(
       String groupname) async {
    Cursor groups = await r
        .table('groups')
        .filter({'name': groupname}).run(_connection);
    List groupList = await groups.toList();
    return groupList.map((e) => MessageGroup.fromJson(e)).toList();
  }

  Stream<MessageGroup> rooms({required User me}) {
    _startReceivingGroups(me);
    return _controller.stream;
  }

  _startReceivingGroups(User me) {
    _subscription = r
        .table('groups')
        .filter(
          (chatroom) =>
              chatroom('members').and(chatroom('admin').ne(me.id)).and(
                    chatroom
                        .hasFields('received_by')
                        .not()
                        .or(chatroom('received_by').contains(me.id).not()),
                  ),
        )
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final chatroom = _groupFromFeed(feedData);
                _controller.sink.add(chatroom);
                _updatewhenReceivedRoomCreated(chatroom, me);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  MessageGroup _groupFromFeed(feedData) {
    var data = feedData['new_val'];
    return MessageGroup.fromJson(data);
  }

  _updatewhenReceivedRoomCreated(MessageGroup chatroom, User me) async {
    Map record = await r.table('groups').get(chatroom.id).update(
        (chatroom) => r.branch(chatroom.hasFields('received_by'), {
              'received_by': chatroom('received_by').append(me.id)
            }, {
              'received_by': [me.id]
            }),
        {'return_changes': 'always'}).run(_connection);
    _removeDeliverredRoom(record['changes'][0]);
  }

  _removeDeliverredRoom(Map record) {
    final List members = record['new_val']['members'];
    final List alreadyReceived = record['new_val']['received_by'];
    final String id = record['new_val']['id'];

    if (members.length > alreadyReceived.length) return;

    r
        .table('groups')
        .get(id)
        .delete({'return_changes': false}).run(_connection);
  }
}
