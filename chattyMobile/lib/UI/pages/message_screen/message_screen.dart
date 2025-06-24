import 'dart:math';

import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/UserProfile/userprofile.dart';
import 'package:hello_world/UI/widgets/message_screen/message_body.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.white,
          child: Stack(children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      height: _size.height * 0.33,
                      padding: EdgeInsets.only(bottom: 5),
                      child: Stack(children: [
                        LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
                              Container(
                            height: constraints.heightConstraints().maxHeight,
                            width: constraints.widthConstraints().maxWidth,
                            decoration: BoxDecoration(
                                color: Color(0xFFDEF5FC),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Transform.rotate(
                              angle: pi / -8,
                              child: CustomPaint(
                                painter: _messageScreenPainter(),
                              ),
                            ),
                          ),
                        ),
                        SafeArea(
                            child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back))),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 50, top: 130),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Blob.fromID(
                                        id: ['5-7-13895'],
                                        size: 120,
                                        styles: BlobStyles(
                                            fillType: BlobFillType.stroke,
                                            strokeWidth: 2,
                                            color: Colors.black),
                                      ),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserProfile())),
                                        child: Container(
                                          width: 111,
                                          height: 111,
                                          child: ClipPath(
                                              clipper:
                                                  BlobClipper(id: '5-7-13895'),
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: Image.asset(
                                                  'assets/Black.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Online',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 5),
                                child: Row(
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.only(left: 5),
                                        onPressed: () {},
                                        icon: Icon(Icons.call)),
                                    IconButton(
                                        padding: EdgeInsets.only(right: 5),
                                        onPressed: () {},
                                        icon: Icon(Icons.videocam_rounded))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                Expanded(child: MessageBody())
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.89,
              child: Container(
                padding: EdgeInsets.only(top: 0, right: 40, bottom: 12),
                width: _size.width,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFDAE4E8),
                            borderRadius: BorderRadius.circular(60)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Material(
                          elevation: 5,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    color: Color(0xFFDEF5FC),
                                    icon: Icon(
                                        Icons.sentiment_satisfied_alt_rounded)),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Write a message...',
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Transform.rotate(
                                      angle: pi / 4,
                                      child: Container(
                                          height: 55,
                                          width: 55,
                                          padding: EdgeInsets.only(
                                              bottom: 4, right: 0.2),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              boxShadow: kElevationToShadow[4],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Transform.rotate(
                                            angle: pi / -1.92,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.send_outlined),
                                              color: Colors.white,
                                            ),
                                          ))),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _messageScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final _linePainter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final _linePath = Path();
    _linePath.moveTo(0, size.height * 0.1);
    _linePath.arcToPoint(
      Offset(size.width * 0.4, size.height * 0.2),
      radius: Radius.circular(130),
    );
    _linePath.moveTo(size.width * 0.4, size.height * 0.2);
    canvas.drawLine(Offset(size.width * 0.4, size.height * 0.2),
        Offset(size.width * 0.75, size.height * 1.1), _linePainter);
    _linePath.moveTo(size.width * 0.75, size.height * 1.1);
    _linePath.arcToPoint(Offset(size.width * 0.75, size.height * 1.2),
        radius: Radius.circular(20));
    canvas.drawPath(_linePath, _linePainter);

    final _secondLinePath = Path();
    _secondLinePath.moveTo(0, size.height * 0.3);
    _secondLinePath.arcToPoint(Offset(size.width * 0.3, size.height * 0.32),
        radius: Radius.circular(120));
    _secondLinePath.moveTo(size.width * 0.3, size.height * 0.32);
    canvas.drawLine(Offset(size.width * 0.3, size.height * 0.32),
        Offset(size.width * 0.6, size.height * 1.11), _linePainter);

    canvas.drawPath(_secondLinePath, _linePainter);
  }

  @override
  bool shouldRepaint(_messageScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_messageScreenPainter oldDelegate) => false;
}
