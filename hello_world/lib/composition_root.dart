/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/UI/pages/home/home_router.dart';
import 'package:hello_world/UI/pages/message_thread/message_thread.dart';
import 'package:hello_world/UI/pages/onboarding/onboarding.dart';
import 'package:hello_world/UI/pages/onboarding/onboarding_router.dart';
import 'package:hello_world/cache/local_cache.dart';
import 'package:hello_world/datasources/datasource_contract.dart';
import 'package:hello_world/datasources/sqflite_impl.dart';
import 'package:hello_world/factory/db_factory.dart';
import 'package:hello_world/services/image_uploader.dart';
import 'package:hello_world/states_management/home/chats_cubit.dart';
import 'package:hello_world/states_management/home/home_cubit.dart';
import 'package:hello_world/states_management/message/messagebloc.dart';
import 'package:hello_world/states_management/messagethread/message_thread_cubit.dart';
import 'package:hello_world/states_management/onboarding/onboarding_cubit.dart';
import 'package:hello_world/states_management/onboarding/profile_image_cubit.dart';
import 'package:hello_world/states_management/receipt/receiptbloc.dart';
import 'package:hello_world/states_management/typing/typing_bloc.dart';
import 'package:hello_world/viewmodels/chat_view_model.dart';
import 'package:hello_world/viewmodels/chats_view_model.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Services/user/user_contract.dart';
import 'package:social_media/social_media.dart';
import 'package:sqflite/sqflite.dart';

import 'UI/pages/home/Home.dart';

class CompositionRoot {
  static late RethinkDb _r;
  static late Connection _connection;
  static late IUserService _userService;
  static late Database _db;
  static late IMessageService _messageService;
  static late IDatasource _datasource;
  static late ILocalCache _localCache;
  static late MessageBloc _messageBloc;
  static late ITypingNotification _typingNotification;
  static late TypingNotificationBloc _typingNotificationBloc;
  static late ChatsCubit _chatsCubit;

  static configure() async {
    _r = RethinkDb();
    _connection = await _r.connect();
    _userService = UserService(_connection, _r);
    _messageService = MessageService(_r, _connection);
    _typingNotification = TypingNotification(_r, _connection, _userService);
    _db = await LocalDatabaseFactory().createDatabase();
    _datasource = SqfliteDatasource(_db);
    final sp = await SharedPreferences.getInstance();
    _localCache = LocalCache(sp);
    _messageBloc = MessageBloc(_messageService);
    _typingNotificationBloc = TypingNotificationBloc(_typingNotification);
    final viewModel = ChatsViewModel(_datasource, _userService);
    _chatsCubit = ChatsCubit(viewModel);
  }

  static Widget? start() {
    final user = _localCache.fetch('USER');
    return user.isEmpty
        ? composeOnboardingUi()
        : composeHomeUi(User.fromJson(user));
  }

  static Widget? composeOnboardingUi() {
    ImageUploader imageUploader = ImageUploader('http://localhost:3000/upload');

    OnboardingCubit onboardingCubit =
        OnboardingCubit(_userService, imageUploader, _localCache);
    ProfileImageCubit imageCubit = ProfileImageCubit();
    IOnboardingRouter router = OnboardingRouter(composeHomeUi);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => onboardingCubit),
      BlocProvider(create: (BuildContext context) => imageCubit),
    ], child: Onboarding(router));
  }

  static Widget composeHomeUi(User me) {
    HomeCubit homeCubit = HomeCubit(_userService, _localCache);
    IHomeRouter router = HomeRouter(showMessageThread: composeMessageThreadUI);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => homeCubit),
        BlocProvider(create: (BuildContext context) => _messageBloc),
        BlocProvider(create: (context) => _typingNotificationBloc),
        BlocProvider(create: (BuildContext context) => _chatsCubit)
      ],
      child: Home(me, router),
    );
  }

  static Widget composeMessageThreadUI(User receiver, User me,
      {required String chatId}) {
    chatViewModel viewModel = chatViewModel(_datasource);
    MessageThreadCubit messageThreadCubit = MessageThreadCubit(viewModel);
    IReceiptService receiptService = ReceiptService(_connection, _r);
    ReceiptBloc receiptBloc = ReceiptBloc(receiptService);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => messageThreadCubit),
          BlocProvider(create: (BuildContext context) => receiptBloc)
        ],
        child: MessageThread(
            receiver, me, _messageBloc, _chatsCubit, _typingNotificationBloc,
            chatId: chatId));
  }
}*/
