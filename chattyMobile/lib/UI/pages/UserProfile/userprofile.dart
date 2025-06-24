import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/chat_ui/chat_ui.dart';
import 'package:hello_world/UI/pages/feedUi/feedUi.dart';
import 'package:hello_world/UI/pages/message_screen/message_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _currentIndex = 0;
  List<IconData> data = [
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.feed_outlined,
    Icons.person_outline
  ];
  final tabs = [ChatUI(), FeedUi(), MessageScreen(), UserProfile()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(children: [
      Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                ClipPath(
                  clipper: userprofilepage_clipper(),
                  child: Container(
                    color: Color(0xFFDEF5FC),
                    height: size.height,
                    width: size.width,
                  ),
                ),
                CustomPaint(
                  painter: userprofilepage_painter(),
                  size: size,
                ),
                Positioned(
                  top: 10,
                  child: SafeArea(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 50,
                                  color: Color(0xFFDAE4E8),
                                ),
                              ),
                              Container(
                                  width: 150,
                                  height: 150,
                                  child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        Text(
                                          "Black Kasema",
                                          style: TextStyle(
                                              color: Color(0xFF011A43),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            "@blackkasema",
                                            style: TextStyle(
                                                color: Color(0xFF011A43)),
                                          ),
                                        ),
                                      ])))
                            ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Posts"),
                                    Text(
                                      "73",
                                      style: TextStyle(
                                          color: Color(0xFF011A43),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Followers"),
                                    Text(
                                      "1,555",
                                      style: TextStyle(
                                          color: Color(0xFF011A43),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Follows"),
                                    Text(
                                      "1,555",
                                      style: TextStyle(
                                          color: Color(0xFF011A43),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 60),
                          height: 255,
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                    indicatorColor: Colors.transparent,
                                    indicator: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFDAE4E8),
                                                width: 2))),
                                    tabs: [
                                      Tab(
                                          child: Icon(
                                              Icons.photo_library_outlined,
                                              color: Colors.black)),
                                      Tab(
                                          child: Icon(
                                        Icons.bookmark_outline_outlined,
                                        color: Colors.black,
                                      )),
                                    ]),
                                Expanded(
                                    child: TabBarView(children: [
                                  Container(
                                    child: GridView.builder(
                                        itemCount: 25,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200),
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Image.asset(
                                                      'assets/Black.jpg',
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  )),
                                            )),
                                  ),
                                  ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[50],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(48))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 25, top: 35),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Color(0xFFDAE4E8),
                                                        child: Icon(
                                                            Icons
                                                                .person_rounded,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Text(
                                                          "Username",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF011A43),
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 25,
                                                      right: 25,
                                                      top: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "This Text is here to check the widget layout and if childern fit properly",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF011A43)),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 15),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 2),
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth: 130,
                                                                maxHeight: 22),
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFFDAE4E8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Center(
                                                            child: Text(
                                                          "29 November 2021"
                                                              .trim(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 7),
                                                              child: Text(
                                                                "10 comments",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF011A43)),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 95,
                                                              height: 50,
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount:
                                                                          2,
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      physics:
                                                                          NeverScrollableScrollPhysics(),
                                                                      itemBuilder: (context,
                                                                              index) =>
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5),
                                                                            child:
                                                                                CircleAvatar(
                                                                              backgroundColor: Color(0xFFDAE4E8),
                                                                              child: Icon(
                                                                                Icons.person_rounded,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          )),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      2),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFDAE4E8),
                                                                child: Center(
                                                                  child: Text(
                                                                    '100+',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                ]))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Material(
            elevation: 10,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
            child: Container(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      width: 35,
                      decoration: BoxDecoration(
                        border: i == _currentIndex
                            ? Border(
                                top:
                                    BorderSide(width: 3.0, color: Colors.black))
                            : null,
                        gradient: i == _currentIndex
                            ? LinearGradient(
                                colors: [Colors.white, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            : null,
                      ),
                      child: Icon(
                        data[i],
                        size: 30,
                        color: i == _currentIndex
                            ? Colors.black
                            : Color(0xFFDAE4E8),
                      ),
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          )),
      Positioned(
        left: MediaQuery.of(context).size.width * 0.435,
        bottom: 40,
        child: GestureDetector(
          child: Container(
              child: Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(22)),
                    child: Transform.rotate(
                      angle: pi / 4,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                  ))),
        ),
      )
    ]);
  }
}

class userprofilepage_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    var first_start = Offset(size.width * 0.5, size.height * 0.7);
    var first_end = Offset(size.width, size.height * 0.35);

    path.quadraticBezierTo(
        first_start.dx, first_start.dy, first_end.dx, first_end.dy);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class userprofilepage_painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final firstCurvePainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Color(0xFFDAE4E8);

    final firstCurvePath = Path();
    firstCurvePath.moveTo(0, size.height * 0.43);
    var first_start = Offset(size.width * 0.5, size.height * 0.74);
    var first_end = Offset(size.width, size.height * 0.43);
    firstCurvePath.quadraticBezierTo(
        first_start.dx, first_start.dy, first_end.dx, first_end.dy);
    canvas.drawPath(firstCurvePath, firstCurvePainter);

    final secondCurvePath = Path();
    secondCurvePath.moveTo(0, size.height * 0.51);
    var firstStart = Offset(size.width * 0.5, size.height * 0.8);
    var firstEnd = Offset(size.width, size.height * 0.51);
    secondCurvePath.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    canvas.drawPath(secondCurvePath, firstCurvePainter);
  }

  @override
  bool shouldRepaint(userprofilepage_painter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(userprofilepage_painter oldDelegate) => true;
}
