import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/UserProfile/userprofile.dart';
import 'package:hello_world/UI/pages/chat_ui/chat_ui.dart';
import 'package:hello_world/UI/pages/chat_ui/new_chat.dart';
import 'package:hello_world/UI/pages/chat_ui/new_friend.dart';

//import 'UI/pages/onboarding/welcome_screen.dart';
//import 'package:hello_world/UI/pages/UserProfile/userprofile.dart';
//import 'package:hello_world/UI/pages/login/login.dart';
//import 'package:hello_world/UI/pages/chat_ui/chat_ui.dart';
import 'package:hello_world/UI/pages/feedUi/feedUi.dart';
import 'package:hello_world/UI/pages/login/login.dart';
import 'package:hello_world/UI/pages/message_screen/message_screen.dart';
import 'package:hello_world/UI/pages/onboarding/welcome_screen.dart';
import 'package:hello_world/UI/widgets/chat/addfriend.dart';
//import 'package:hello_world/UI/pages/message_screen/message_screen.dart';
//import 'package:hello_world/UI/pages/login/login.dart';
//import 'package:hello_world/composition_root.dart';
//import 'package:hello_world/theme.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await CompositionRoot.configure();
  // final firstPage = CompositionRoot.start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  final Widget firstPage;
  // MyApp(this.firstPage);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: WelcomeScreen());
  }
}
