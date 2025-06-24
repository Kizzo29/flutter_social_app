import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hello_world/UI/pages/login/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Stack(children: [
            Stack(
              children: [
                CustomPaint(
                  painter: home_screen_painter(),
                  size: _size,
                ),
                Container(
                  child: ClipPath(
                    clipper: first_welcome_clipper(),
                    child: Container(
                      color: Color(0xFFDEF5FC),
                      height: _size.height / 1.3,
                      width: _size.width,
                    ),
                  ),
                ),
                Container(
                  child: ClipPath(
                    clipper: second_welcome_clipper(),
                    child: Container(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Welcome to",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          "Friendy",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/Background copy.png",
                    fit: BoxFit.contain,
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 90,
                left: 290,
                child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInPage())),
                  child: Row(
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        ));
  }
}

class first_welcome_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(size.width * 0.43, 0);
    path.lineTo(size.width * 0.7, size.height * 0.152);
// firstLine
    var first_start = Offset(size.width * 1.035, size.height * 0.315);
    var first_end = Offset(size.width * 0.79, size.height * 0.515);

    path.quadraticBezierTo(
        first_start.dx, first_start.dy, first_end.dx, first_end.dy);
//SecondLine
    var second_start = Offset(size.width * 0.021, size.height);
    var second_end = Offset(0, size.height * 1.001);

    path.quadraticBezierTo(
        second_start.dx, second_start.dy, second_end.dx, second_end.dy);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class second_welcome_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(size.width * 0.575, size.height);
    path.lineTo(size.width * 0.45, size.height * 0.94);
    var _firstStart = Offset(size.width * 0.3, size.height * 0.87);
    var _firstend = Offset(size.width * 0.44, size.height * 0.82);
    path.quadraticBezierTo(
        _firstStart.dx, _firstStart.dy, _firstend.dx, _firstend.dy);
    path.lineTo(size.width * 0.72, size.height * 0.69);
    var _secondStart = Offset(size.width * 0.83, size.height * 0.65);
    var _secondend = Offset(size.width, size.height * 0.74);
    path.quadraticBezierTo(
        _secondStart.dx, _secondStart.dy, _secondend.dx, _secondend.dy);
    path.lineTo(size.width, size.height * 0.86);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class PainterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class home_screen_painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final FirstLinePainter = Paint()
      ..color = Color(0xFFDEF5FC)
      ..strokeWidth = 1;
    canvas.drawLine(Offset(size.width * 0.73, 0),
        Offset(size.width, size.height * 0.12), FirstLinePainter);

    final SecondLinePainter = Paint()
      ..color = Color(0xFFDEF5FC)
      ..strokeWidth = 1;
    canvas.drawLine(Offset(size.width, size.height * 0.37),
        Offset(0, size.height * 0.85), SecondLinePainter);

    final cPathPainter = Paint()
      ..color = Color(0xFF000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final cPath = Path();
    cPath.moveTo(size.width, size.height * 0.72762);
    cPath.quadraticBezierTo(size.width * 0.8, size.height * 0.635,
        size.width * 0.7, size.height * 0.689);
    cPath.moveTo(size.width * 0.7, size.height * 0.689);
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.689),
        Offset(size.width * 0.43, size.height * 0.8145), cPathPainter);
    cPath.moveTo(size.width * 0.43, size.height * 0.8145);

    cPath.quadraticBezierTo(size.width * 0.255, size.height * 0.878,
        size.width * 0.47, size.height * 0.962);
    cPath.moveTo(size.width * 0.47, size.height * 0.962);
    canvas.drawLine(Offset(size.width * 0.47, size.height * 0.962),
        Offset(size.width * 0.555, size.height), cPathPainter);
    canvas.drawPath(cPath, cPathPainter);
  }

  @override
  bool shouldRepaint(home_screen_painter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(home_screen_painter oldDelegate) => true;
}
