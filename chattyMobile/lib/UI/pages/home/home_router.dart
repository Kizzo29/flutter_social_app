/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/chat.dart';
import 'package:social_media/social_media.dart';

abstract class IHomeRouter {
  Future<void> onShowMessageThread(
      BuildContext context, List<User> receiver, User me, Chat chat);

  Future<void> onShowCreateGroup(
      BuildContext context, List<User> activeUsers, User me);
}

class HomeRouter implements IHomeRouter {
  final Widget Function(List<User> receiver, User me, Chat chat)
      showMessageThread;

  final Widget Function(List<User> receiver, User me, Chat chat)
      onshowCreatedThread;
  HomeRouter(this.onshowCreatedThread, this.showMessageThread);

  @override
  Future<void> onShowMessageThread(
      BuildContext context, List<User> receiver, User me, Chat chat) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => showMessageThread(receiver, me, chat),
        ));
  }

  @override
  Future<void> onShowCreateGroup(
      BuildContext context, List<User> activeUsers, User me) async {
    showCupertinoModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (context) => onShowCreateGroup(context, activeUsers, me));
  }
}*/
