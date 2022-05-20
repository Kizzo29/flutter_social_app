import 'package:social_media/social_media.dart';

class LocalMessage {
  late String chatId;
  late String _id;
  late Message message;
  late ReceiptStatus receipt;
  String get id => _id;

  LocalMessage(this.chatId, this.message, this.receipt);

  Map<String, dynamic> toMap() => {
        'chat_id': chatId,
        'id': message.id,
        'roomId': message.roomId,
        'sender': message.from,
        'receiver': message.to,
        'contents': message.contents,
        'receipt': receipt.value(),
        'received_at': message.time_record.toString()
      };

  factory LocalMessage.fromMap(Map<String, dynamic> json) {
    final message = Message(
      from: json['sender'],
      to: json['receiver'],
      contents: json['contents'],
      time_record: DateTime.parse(json['received_at']),
    );

    final localMessage = LocalMessage(
        json['chat_id'], message, EnumParsing.fromString(json['receipt']));
    localMessage._id = json['id'];
    return localMessage;
  }
}
