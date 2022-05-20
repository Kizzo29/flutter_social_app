import 'package:social_media/Models/message.dart';
import 'package:social_media/Models/message_group.dart';
import 'package:social_media/Models/user.dart';

abstract class IMessageService {
  Future<Message> send(List<Message> message);
  Stream<Message> messages({required User activeUser});
  Stream<Message> group_requests({required MessageGroup group});
  dispose();
}
