/*import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/home/home_router.dart';
import 'package:hello_world/UI/widgets/home/profile_image.dart';
import 'package:hello_world/colors.dart';
import 'package:hello_world/models/chat.dart';
import 'package:hello_world/states_management/home/chats_cubit.dart';
import 'package:hello_world/states_management/message/messagebloc.dart';
import 'package:hello_world/states_management/typing/typing_bloc.dart';
import 'package:hello_world/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_media/social_media.dart';

class Chats extends StatefulWidget {
  final User user;
  final IHomeRouter router;
  Chats(this.user, this.router);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var chats = [];
  final typingEvents = [];
  @override
  void initState() {
    super.initState();
    _updateOnMessageReceived();
    context.read<ChatsCubit>().chats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, List<Chat>>(builder: (_, chats) {
      this.chats = chats;
      if (this.chats.isEmpty) return Container();
      List<String> userIds = [];
      chats.forEach((chat) {
        userIds == chat.members!.map((e) => e.id).toList();
      });

      context.read<TypingNotificationBloc>().add(
          TypingNotificationEvent.onSubscribed(widget.user,
              usersWithChat: userIds.toSet().toList()));
      return _buildListView();
    });
  }

  _buildListView() {
    ListView.separated(
        itemBuilder: (_, indx) => GestureDetector(
              child: _chatItem(chats[indx]),
              onTap: () async {
                await this.widget.router.onShowMessageThread(
                    context, chats[indx].members, widget.user,
                    chats[indx]);

                await context.read<ChatsCubit>().chats();
              },
            ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: chats.length);
  }

  _chatItem(Chat chat) => ListTile(
        leading: ProfileImage(
          imageUrl: chat.type == ChatType.individual ? chat.members!.first.photourl : null,
          online: chat.type == ChatType.individual ? chat.members.active,
        ),
        title: Text(
          chat.from.username,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold,
                color: isLightTheme(context) ? Colors.black : Colors.white,
              ),
        ),
        subtitle: BlocBuilder<TypingNotificationBloc, TypingState>(
            builder: (__, state) {
          if (state is TypingReceivedSuccess &&
              state.event.event == Typing.start &&
              state.event.from == chat.from.id)
            this.typingEvents.add(state.event.from);

          if (state is TypingReceivedSuccess &&
              state.event.event == Typing.stop &&
              state.event.from == chat.from.id)
            this.typingEvents.remove(state.event.from);

          if (this.typingEvents.contains(chat.from.id))
            return Text('typing...',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontStyle: FontStyle.italic));

          return Text(
            chat.mostRecent!.message.contents,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Theme.of(context).textTheme.overline!.copyWith(
                color: isLightTheme(context) ? Colors.black54 : Colors.white70,
                fontWeight:
                    chat.unread > 0 ? FontWeight.bold : FontWeight.normal),
          );
        }),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              DateFormat('h:mm a').format(chat.mostRecent!.message.time_record),
              style: Theme.of(context).textTheme.overline!.copyWith(
                    color:
                        isLightTheme(context) ? Colors.black54 : Colors.white70,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: chat.unread > 0
                    ? Container(
                        height: 15.0,
                        width: 15.0,
                        color: kPrimary,
                        alignment: Alignment.center,
                        child: Text(
                          chat.unread.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .overline!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            )
          ],
        ),
      );

  void _updateOnMessageReceived() {
    final chatsCubit = context.read<ChatsCubit>();
    context.read<MessageBloc>().stream.listen((state) async {
      if (state is MessageReceivedSuccess) {
        await chatsCubit.viewModel.receivedMessage(state.message);
        chatsCubit.chats();
      }
    });
  }
}*/
