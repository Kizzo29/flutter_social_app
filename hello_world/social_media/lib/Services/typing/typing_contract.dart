import 'package:flutter/cupertino.dart';
import 'package:social_media/Models/typing.dart';
import 'package:social_media/Models/user.dart';

abstract class ITypingNotification {
  Future<bool> send({@required List<TypingEvent> event});
  Stream<TypingEvent> subscribe(User user, List<String> userIds);
  dispose();
}
