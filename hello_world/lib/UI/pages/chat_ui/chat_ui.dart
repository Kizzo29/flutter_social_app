import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hello_world/UI/pages/UserProfile/userprofile.dart';
import 'package:hello_world/UI/pages/chat_ui/new_friend.dart';
import 'package:hello_world/UI/pages/feedUi/feedUi.dart';

import 'package:hello_world/UI/widgets/chat/chat_tile.dart';
import 'package:hello_world/UI/widgets/chat/friend_circle.dart';
import 'package:hello_world/UI/widgets/chat/new_chat.dart';
import 'slidable_action.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({Key? key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  int index = 0;
  final items = List.generate(20, (index) => FriendsCircle());
  final chat_tiles = List.generate(20, (index) => ChatTile());
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            ClipPath(
              child: Container(
                color: Color(0xFFDEF5FC),
                height: size.height,
                width: size.width,
              ),
              clipper: ChatUI_Clipper(),
            ),
            CustomPaint(
              size: size,
              painter: first_curve_painter(),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverOpacity(
                  opacity: 0.8,
                  sliver: SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    expandedHeight: 100,
                    toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(60),
                      child: Material(
                        shadowColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 15, bottom: 5),
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Text(
                                  'Messages',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Feed',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                            indicator: BoxDecoration(
                                color: Color(0xFFDAE4E8),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
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
                      Opacity(
                        opacity: 0.8,
                        child: Padding(
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
                                                  color: Colors.black),
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
                                              color: Colors.black,
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
                      ),
                      /*   Opacity(
                        opacity: 0.8,
                        child: Padding(
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
                            )),
                      ),*/
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
                                          builder: (context) => UserProfile())),
                                  icon: Icon(Icons.person_rounded),
                                  iconSize: 27,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewFriend(items: [
                                                  'A',
                                                  'B',
                                                  'C',
                                                  'E',
                                                  'D',
                                                  'F',
                                                  'G',
                                                  'H',
                                                  'I',
                                                  'J',
                                                  'K',
                                                  'L',
                                                  'M',
                                                  'N',
                                                  'O',
                                                  'P',
                                                  'Q',
                                                  'R',
                                                  'S',
                                                  'T',
                                                  'U',
                                                  'W',
                                                  'X',
                                                  'Y',
                                                  'Z',
                                                ]))),
                                    child: AnimatedContainer(
                                      width: 60,
                                      height: 60,
                                      duration: Duration(milliseconds: 300),
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(600),
                                          boxShadow: kElevationToShadow[3],
                                          color: Color(0xFFDAE4E8)),
                                      child: Icon(
                                        Icons.person_add_alt_1_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Add',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )),
                                ],
                              )),
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      item,
                                      Container(
                                        child: Text(
                                          'Black',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Kasema',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ]);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, _index) {
                    final chatTile = chat_tiles[_index];

                    return Slidable(
                        endActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white70,
                              icon: Icons.delete,
                              label: 'delete',
                              onPressed: (BuildContext) =>
                                  onDismissed(index, SlideAction.delete))
                        ]),
                        child: chatTile);
                  }, childCount: items.length),
                ),
              ],
            ),
            NewChatBox()
          ]),
        ),
        FeedUi(),
      ]),
    );
  }

  onDismissed(int index, SlideAction action) {
    setState(() {
      chat_tiles.removeAt(index);
    });
  }
}

class ChatUI_Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.465);

    var first_start = Offset(size.width * 0.55, size.height * 0.1);
    var first_end = Offset(size.width, size.height * 0.5);
    path.quadraticBezierTo(
        first_start.dx, first_start.dy, first_end.dx, first_end.dy);

    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class first_curve_painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final firstCurvePainter = Paint()
      ..color = Color(0xFFDAE4E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final first_curve_path = Path();
    first_curve_path.moveTo(0, size.height * 0.41);
    var firstStart = Offset(size.width * 0.55, size.height * 0.04);
    var firstEnd = Offset(size.width, size.height * 0.43);
    first_curve_path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    canvas.drawPath(first_curve_path, firstCurvePainter);

    final secondCurvePainter = Paint()
      ..color = Color(0xFFDAE4E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final second_curve_path = Path();
    second_curve_path.moveTo(0, size.height * 0.33);
    var secondStart = Offset(size.width * 0.55, -10);
    var secondEnd = Offset(size.width, size.height * 0.35);
    second_curve_path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    canvas.drawPath(second_curve_path, secondCurvePainter);
  }

  @override
  bool shouldRepaint(first_curve_painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(first_curve_painter oldDelegate) => false;
}

class MenuItem {
  final String text;
  final IconData icon;
  const MenuItem({required this.text, required this.icon});
}
