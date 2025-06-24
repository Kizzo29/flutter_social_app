import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:social_media/Models/typing.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/typing/typing_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:social_media/Services/user/user_contract.dart';

class TypingNotification implements ITypingNotification {
  late Connection _connection;
  late RethinkDb r;

  final _controller = StreamController<TypingEvent>.broadcast();
  late StreamSubscription _changestream;
  late IUserService ? _userService;

  TypingNotification(this.r, this._connection, this._userService);

  @override
  dispose() {
    _controller.close();
    _changestream.cancel();
  }

  @override
  Future<bool> send({@required List<TypingEvent>? event}) async {
    final receivers =
        await _userService!.fetch(event!.map((e) => e.to).toList());
    if (receivers.isEmpty) return false;
    event.retainWhere(
        (events) => receivers.map((e) => e.id).contains(events.to));
    final data = event.map((e) => e.toJson()).toList();
    Map record = await r
        .table('typing_events')
        .insert(data, {'conflict': 'update'}).run(_connection);
    return record['inserted'] == 1;
  }

  @override
  Stream<TypingEvent> subscribe(User user, List<String> userIds) {
    _startReceivingTypingEvents(user, userIds);
    return _controller.stream;
  }

  _startReceivingTypingEvents(User user, List<String> userIds) {
    _changestream = r
        .table('typing_events')
        .filter((event) {
          return event('to')
              .eq(user.id)
              .and(r.expr(userIds).contains(event('from')));
        })
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final typing = _eventFromFeed(feedData);
                _controller.sink.add(typing);
                _removeEvent(typing);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  TypingEvent _eventFromFeed(feedData) {
    return TypingEvent.fromJson(feedData['new_val']);
  }

  _removeEvent(TypingEvent event) {
    r
        .table('typing_events')
        .filter({'chat_id': event.chatId})
        .delete({'return_changes': false}).run(_connection);
  }
}
