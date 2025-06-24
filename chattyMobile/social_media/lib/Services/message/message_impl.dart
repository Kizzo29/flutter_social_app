import 'dart:async';
import 'package:social_media/Models/message.dart';
import 'package:social_media/Models/message_group.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/encryption/encrypt_contract.dart';
import 'package:social_media/Services/message/message_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class MessageService implements IMessageService {
 late final Connection _connection;
 late final RethinkDb r;
 late final IEncryption? _encryption;

  final _controller = StreamController<Message>.broadcast();
  StreamSubscription? _changestream;

  MessageService(this.r, this._connection, {IEncryption? encryption})
      : _encryption = encryption;

  @override
  dispose() {
    _changestream?.cancel();
    _controller.close();
  }

  @override
  Future<Message> send(List<Message> message) async {
    final data = message.map((message) {
      var data = message.toJson();
      if (_encryption != null)
        data['contents'] = _encryption!.encrypt(message.contents);
      return data;
    }).toList();

    Map record = await r
        .table('messages')
        .insert(data, {'return_changes': true}).run(_connection);
    return Message.fromJson(record['changes'].first['new_val']);
  }

  Stream<Message> messages({required User activeUser}) {
    _startReceivingMessages(activeUser);
    return _controller.stream;
  }

  _startReceivingMessages(User user) {
    _changestream = r
        .table('messages')
        .filter({'to': user.id})
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final message = _messageFromFeed(feedData);
                _controller.sink.add(message);
                _removeDeliverredMessage(message);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  Message _messageFromFeed(feedData) {
    var data = feedData['new_val'];
    if (_encryption != null)
      data['contents'] = _encryption!.decrypt(data['contents']);
    return Message.fromJson(data);
  }

  _removeDeliverredMessage(Message message) {
    r.table('messages').get(message.id).delete({'return_changes': false});
  }

  @override
  Stream<Message> group_requests({required MessageGroup group}) {
    _startReceivingRequests(group);
    return _controller.stream;
  }

  _startReceivingRequests(MessageGroup group) {
     _changestream = r
        .table('messages')
        .filter({'to': group.id})
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final message = _messageFromFeed(feedData);
                _controller.sink.add(message);
                _removeDeliverredMessage(message);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }
}
