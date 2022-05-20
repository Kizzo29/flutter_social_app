import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/chat_ui/chat_ui.dart';
import 'package:hello_world/UI/widgets/login_widgets/custom_text_field.dart';
import 'package:hello_world/UI/widgets/login_widgets/login_bottom.dart';
import 'package:hello_world/UI/widgets/login_widgets/login_foot.dart';
import 'package:hello_world/UI/widgets/login_widgets/login_social_icons.dart';
import 'package:hello_world/UI/widgets/login_widgets/upload_profile.dart';

class LogInPage extends StatefulWidget {
  LogInPage();

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  OverlayEntry? entry;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          ClipPath(
            child: Container(
              color: Color(0xFFDEF5FC),
            ),
            clipper: login_top_clipper(),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 20,
                      color: Color(0xFF011A43),
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.45,
                )),
                UploadProfile(),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.55,
                )),
                Container(
                    height: size.height * 0.3,
                    width: size.width,
                    child: Builder(
                        builder: (context) => Form(
                                child: Column(children: [
                              CustomTextField(
                                  "Username",
                                  (val) {},
                                  TextInputAction.next,
                                  Icons.person,
                                  TextInputType.text),
                              Flexible(
                                  child: FractionallySizedBox(
                                heightFactor: 0.5,
                              )),
                              CustomTextField(
                                  "Email",
                                  (val) {},
                                  TextInputAction.next,
                                  Icons.email_rounded,
                                  TextInputType.emailAddress),
                              Flexible(
                                  child: FractionallySizedBox(
                                heightFactor: 0.8,
                              )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ElevatedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatUI())),
                                    child: Container(
                                      height: 45.0,
                                      width: 200,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Sign Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button!
                                            .copyWith(
                                                fontSize: 18.0,
                                                color: Color(0xFF011A43),
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFDEF5FC),
                                        elevation: 5.0,
                                        shadowColor: Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ))
                            ])))),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.2,
                )),
                Login_bottom(
                    false,
                    () => showModalBottomSheet(
                        enableDrag: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        context: context,
                        builder: (context) => buildSheet())),
                SizedBox(height: size.height * 0.05),
                LoginFoot(),
                SizedBox(
                  height: size.height * 0.037,
                ),
                LogInSocialIcons(),
              ],
            ),
          ),
          ClipPath(
            child: Container(
              color: Color(0xFFDEF5FC),
            ),
            clipper: login_bottom_clipper(),
          ),
        ]));
  }

  makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
  Widget buildSheet() => makeDismissible(
          child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 1,
        builder: (_, controller) => Stack(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Builder(
                  builder: (context) => Form(
                          child: Column(
                        children: [
                          Spacer(),
                          Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color(0xFF011A43),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.7,
                          )),
                          CustomTextField(
                              "Username",
                              (val) {},
                              TextInputAction.none,
                              Icons.person,
                              TextInputType.name),
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.4,
                          )),
                          CustomTextField(
                              "Email",
                              (val) {},
                              TextInputAction.none,
                              Icons.email,
                              TextInputType.name),
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.65,
                          )),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatUI())),
                            child: Container(
                              height: 45.0,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                        fontSize: 18.0,
                                        color: Color(0xFF415155),
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFDEF5FC),
                                elevation: 5.0,
                                shadowColor: Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          Spacer(),
                          LoginFoot(),
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.5,
                          )),
                          LogInSocialIcons(),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Login_bottom(
                                  true, () => Navigator.of(context).pop()))
                        ],
                      )))),
          ClipPath(
            child: Container(
              color: Color(0xFFDEF5FC),
            ),
            clipper: login_bottom_clipper(),
          ),
        ]),
      ));
}

class login_top_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.42, size.height * 0);

    var firstStart = Offset(size.width * 0.3, size.height * 0.15);
    var firstEnd = Offset(0, size.height * 0.21);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class login_bottom_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.55, size.height);

    var first_start = Offset(size.width * 0.58, size.height * 0.92);
    var first_end = Offset(size.width * 0.7, size.height * 0.923);

    path.quadraticBezierTo(
        first_start.dx, first_start.dy, first_end.dx, first_end.dy);

    var second_start = Offset(size.width * 0.81, size.height * 0.934);
    var second_end = Offset(size.width * 0.844, size.height * 0.895);

    path.quadraticBezierTo(
        second_start.dx, second_start.dy, second_end.dx, second_end.dy);

    var third_start = Offset(size.width * 0.9, size.height * 0.84);
    var third_end = Offset(size.width, size.height * 0.85);

    path.quadraticBezierTo(
        third_start.dx, third_start.dy, third_end.dx, third_end.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
