import 'package:hello_world/datasources/datasource_contract.dart';
import 'package:hello_world/models/local_message.dart';
import 'package:hello_world/viewmodels/base_view_model.dart';
import 'package:social_media/social_media.dart';
import 'package:hello_world/models/chat.dart';

class ChatsViewModel extends BaseViewModel {
  IDatasource _datasource;
  IUserService _userService;

  ChatsViewModel(this._datasource, this._userService) : super(_datasource);

  Future<List<Chat>> getChats() async {
    final chats = await _datasource.findAllChats();
    await Future.forEach(chats, (chat) async {
      final ids = chat!.membersId.map<String>((e) => e.keys.first).toList();
      final users = await _userService.fetch(ids);
      chat.members = users;
    });

    return chats;
  }

  Future<void> receivedMessage(Message message) async {
    final chatId = message.roomId != null ? message.roomId : message.from;
    LocalMessage localMessage =
        LocalMessage(chatId!, message, ReceiptStatus.deliverred);
    await addMessage(localMessage);
  }
}
