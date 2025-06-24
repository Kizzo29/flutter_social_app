import 'package:social_media/Models/message_group.dart';
import 'package:social_media/Models/user.dart';

abstract class IMessageGroup {
  Future<MessageGroup> create(String myId, MessageGroup group);
  Future<void> remove(String userId, MessageGroup group);
  Future<void> addMember(String userId, MessageGroup group);
  Stream<MessageGroup> rooms({required User me});
  Future<List<MessageGroup>> fetch(String groupname);
  dispose();
}
