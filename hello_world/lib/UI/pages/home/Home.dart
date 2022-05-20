/*import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/home/home_router.dart';
import 'package:hello_world/UI/widgets/home/active/active.dart';
import 'package:hello_world/UI/widgets/home/chats/chats.dart';
import 'package:hello_world/UI/widgets/home/profile_image.dart';
import 'package:hello_world/UI/widgets/shared/header_status.dart';
import 'package:hello_world/states_management/home/chats_cubit.dart';
import 'package:hello_world/states_management/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/states_management/home/home_state.dart';
import 'package:hello_world/states_management/message/messagebloc.dart';
import 'package:social_media/social_media.dart';

class Home extends StatefulWidget {
  final User me;
  final IHomeRouter router;
  const Home(this.me, this.router);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.me;
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: HeaderStatus(_user.username, _user.photourl, true),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (_, state) => state is HomeSuccess
                              ? Text('Active(${state.onlineUsers.length})')
                              : Text('Active(0)')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Chats(_user, widget.router),
              ActiveUsers(_user, widget.router),
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;

  void _initialSetup() async {
    final user =
        (!_user.active) ? await context.read<HomeCubit>().connect() : _user;

    context.read<ChatsCubit>().chats();
    context.read<HomeCubit>().activeUsers(user);
    context.read<MessageBloc>().add(MessageEvent.onSubscribed(user));
  }
}*/
