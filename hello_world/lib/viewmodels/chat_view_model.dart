import 'package:hello_world/datasources/datasource_contract.dart';
import 'package:hello_world/models/local_message.dart';
import 'package:hello_world/viewmodels/base_view_model.dart';
import 'package:social_media/social_media.dart';

class chatViewModel extends BaseViewModel {
  IDatasource _datasource;
  int otherMessages = 0;
  String _chatId = '';
  String get chatId => _chatId;
  chatViewModel(this._datasource) : super(_datasource);

  Future<List<LocalMessage>> getMessages(String chatId) async {
    final messages = await _datasource.findMessages(chatId);
    if (messages.isNotEmpty) _chatId = chatId;
    return messages;
  }

  Future<void> sentMessage(Message message) async {
    final chatId = message.roomId != null ? message.roomId : message.to;
    LocalMessage localMessage =
        LocalMessage(chatId!, message, ReceiptStatus.sent);
    if (_chatId.isNotEmpty) return await _datasource.addMessage(localMessage);
    _chatId = localMessage.chatId;
    await addMessage(localMessage);
  }

  Future<void> receivedMessages(Message message) async {
   final chatId = message.roomId != null ? message.roomId : message.from;
    LocalMessage localMessage =
        LocalMessage(chatId!, message, ReceiptStatus.deliverred);
    if (_chatId.isEmpty) _chatId = localMessage.chatId;
    if (localMessage.chatId != _chatId) otherMessages++;
    await addMessage(localMessage);
  }

  Future<void> updateMessageReceipt(Receipt receipt) async {
    await _datasource.updateMessageReceipt(receipt.messageId, receipt.status);
  }
}
