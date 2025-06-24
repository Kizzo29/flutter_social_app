import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/UserProfile/userprofile.dart';
import 'package:hello_world/UI/pages/chat_ui/chat_ui.dart';
import 'package:hello_world/UI/pages/message_screen/message_screen.dart';
import 'package:hello_world/UI/widgets/feed/post_section.dart';

class FeedUi extends StatefulWidget {
  FeedUi();

  @override
  _FeedUiState createState() => _FeedUiState();
}

class _FeedUiState extends State<FeedUi> {
  int _currentIndex = 0;
  List<IconData> data = [
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.feed_outlined,
    Icons.person_outline
  ];
  final tabs = [ChatUI(), FeedUi(), MessageScreen(), UserProfile()];
  bool _folded = true;
  List<FeedPost> _post = [
    FeedPost(type: PostType.text, post: ""),
    FeedPost(type: PostType.photo, post: ""),
    FeedPost(type: PostType.audio, post: ""),
    FeedPost(type: PostType.video, post: ""),
    FeedPost(type: PostType.text, post: "")
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
          body: Stack(children: [
            ClipPath(
              child: Container(
                color: Color(0xFFDEF5FC),
                height: size.height,
                width: size.width,
              ),
              clipper: feedui_clipper(),
            ),
            CustomPaint(
              painter: feedui_painter(),
              size: size,
            ),
            CustomScrollView(
              slivers: [
                SliverOpacity(
                  opacity: 0.7,
                  sliver: SliverAppBar(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      floating: true,
                      snap: true,
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Image.asset(
                          'assets/Background copy.png',
                          width: 50,
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: _folded ? 45 : 190,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFFDAE4E8),
                                boxShadow: _folded
                                    ? kElevationToShadow[0]
                                    : kElevationToShadow[2]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(left: 16),
                                  child: !_folded
                                      ? TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Search...',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              border: InputBorder.none),
                                        )
                                      : null,
                                )),
                                AnimatedContainer(
                                  padding: EdgeInsets.all(10),
                                  duration: Duration(milliseconds: 400),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkResponse(
                                      child: _folded
                                          ? Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                      onTap: () {
                                        setState(() {
                                          _folded = !_folded;
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        /*   Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: AnimatedContainer(
                              width: 45,
                              height: 50,
                              duration: Duration(milliseconds: 400),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFFDAE4E8),
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkResponse(
                                  onTap: () {},
                                  radius: 20,
                                  child: Icon(
                                    Icons.dark_mode_outlined,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                ),
                              ),
                            )),*/
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 5, top: 5, bottom: 5),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xFFDAE4E8)),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkResponse(
                                onTap: () {},
                                radius: 20,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 4,
                                  ),
                                  child: IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserProfile())),
                                    icon: Icon(
                                      Icons.person_rounded,
                                      size: 27,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 165,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 10),
                          child: Text(
                            "Feed",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          height: 105,
                          margin: EdgeInsets.only(bottom: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 7),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: 65,
                                          height: 65,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              boxShadow: kElevationToShadow[3],
                                              color: Colors.grey[100]),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            size: 40,
                                            color: Color(0xFF011A43),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        "My Story",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF011A43)),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 10,
                                                bottom: 2),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: Color(
                                                          0xFF011A43,
                                                        ),
                                                        width: 3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Black",
                                            style: TextStyle(
                                                fontSize: 10,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Text("Kasema",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis))
                                        ],
                                      );
                                    })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => _post[index].type == PostType.text
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25, top: 35),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xFFDAE4E8),
                                      child: Icon(
                                        Icons.person_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Username",
                                        style: TextStyle(
                                            color: Color(0xFF011A43),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 25, right: 25, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "This Text is here to check the widget layout and if childern fit properly",
                                      style:
                                          TextStyle(color: Color(0xFF011A43)),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        constraints: BoxConstraints(
                                            maxWidth: 130, maxHeight: 22),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFDAE4E8),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Text(
                                          "29 November 2021".trim(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => showModalBottomSheet(
                                          enableDrag: true,
                                          isScrollControlled: false,
                                          context: context,
                                          builder: (context) => buildSheet()),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 7),
                                              child: Text(
                                                "10 comments",
                                                style: TextStyle(
                                                    color: Color(0xFF011A43)),
                                              ),
                                            ),
                                            Container(
                                              width: 95,
                                              height: 50,
                                              child: ListView.builder(
                                                  itemCount: 2,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context,
                                                          index) =>
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Color(0xFFDAE4E8),
                                                          child: Icon(
                                                            Icons
                                                                .person_rounded,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: GestureDetector(
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFFDAE4E8),
                                                  child: Center(
                                                    child: Text(
                                                      '100+',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: Stack(children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/Black.jpg',
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 500,
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        left: 25,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xFFDAE4E8),
                                                child: Icon(
                                                  Icons.person_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Username",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                  Text('2 minutes ago',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 35,
                                        left: 40,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: 80,
                                                height: 30,
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 13,
                                                              right: 5),
                                                      child: Icon(
                                                        Icons
                                                            .thumb_up_alt_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "73K",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: 80,
                                                height: 30,
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 20),
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 13,
                                                              right: 5),
                                                      child: Icon(
                                                        Icons.message_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "10K",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 30),
                                                width: 70,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 8,
                                                              left: 10),
                                                      child: Transform.rotate(
                                                        angle: pi / -2.8,
                                                        child: Icon(
                                                          Icons.send_outlined,
                                                          color: Colors.white,
                                                          size: 35,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "Chat",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]))),
                          ),
                        ),
                  childCount: 5,
                ))
              ],
            ),
          ]),
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
          onTap: () {},
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
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              Text(
                'djvedvuksdcecxwsjdjwcvskvckevckqwevckwvcjcqveyidbcaskcascaskcvasycascbasnvbdjvdjdjcvejcv',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'djvedvuksdcecxwsjdjwcvskvckevckqwevckwvcjcqveyidbcaskcascaskcvasycascbasnvbdjvdjdjcvejcv',
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ],
          ),
        ),
      ));
}

class feedui_clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(0, 0);
    var first_start = Offset(size.width * 0.95, size.height * 0.31);
    var second_start = Offset(0, size.height * 0.6);

    path.quadraticBezierTo(
        first_start.dx, first_start.dy, second_start.dx, second_start.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class feedui_painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final feedUiPaint = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final firstFeedUiPath = Path();
    firstFeedUiPath.moveTo(0, size.height * 0.12);
    var _firstStart = Offset(size.width * 0.4, size.height * 0.25);
    var _firstEnd = Offset(size.width * 0.42, size.height * 0.406);

    firstFeedUiPath.quadraticBezierTo(
        _firstStart.dx, _firstStart.dy, _firstEnd.dx, _firstEnd.dy);
    canvas.drawPath(firstFeedUiPath, feedUiPaint);
    //
    final secondFeedUiPath = Path();
    secondFeedUiPath.moveTo(0, size.height * 0.22);
    var _secondStart = Offset(size.width * 0.3, size.height * 0.3);
    var _secondEnd = Offset(size.width * 0.315, size.height * 0.478);

    secondFeedUiPath.quadraticBezierTo(
        _secondStart.dx, _secondStart.dy, _secondEnd.dx, _secondEnd.dy);
    canvas.drawPath(secondFeedUiPath, feedUiPaint);
  }

  @override
  bool shouldRepaint(feedui_painter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(feedui_painter oldDelegate) => true;
}
