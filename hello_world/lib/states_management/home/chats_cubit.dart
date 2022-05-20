import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/models/chat.dart';
import 'package:hello_world/viewmodels/chats_view_model.dart';

class ChatsCubit extends Cubit<List<Chat>> {
  final ChatsViewModel viewModel;

  ChatsCubit(this.viewModel) : super([]);

  Future<void> chats() async {
    final chats = await viewModel.getChats();
    emit(chats);
  }
}
