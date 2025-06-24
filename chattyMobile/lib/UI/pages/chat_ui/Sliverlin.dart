/*import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hello_world/UI/pages/chat_ui/slidable_action.dart';
import 'package:hello_world/UI/pages/feedUi/feedUi.dart';
import 'package:hello_world/UI/widgets/chat/chat_tile.dart';
import 'package:hello_world/UI/widgets/chat/friend_circle.dart';
import 'package:hello_world/UI/widgets/chat/new_chat.dart';

class Sliverlin extends StatefulWidget {
  const Sliverlin({Key? key}) : super(key: key);

  @override
  State<Sliverlin> createState() => _SliverlinState();
}

class _SliverlinState extends State<Sliverlin> {
  bool _folded = true;
  int index = 0;
  final items = List.generate(20, (index) => FriendsCircle());
  final chat_tiles = List.generate(70, (index) => ChatTile());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        Scaffold(
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
                    snap: true,
                    floating: true,
                    backgroundColor: Colors.white,
                    elevation: 3,
                    expandedHeight: 150,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(80),
                      child: Opacity(
                        opacity: 0.8,
                        child: Material(
                          shadowColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: TabBar(
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Messages',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Feed',
                                    style: TextStyle(
                                        color: Colors.black,
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
                      ),
                      Opacity(
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
                      ),
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
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 27,
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
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 7),
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
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(600),
                                      color: Color(0xFFDAE4E8)),
                                  child: Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                        child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 14),
                                    )),
                                    Container(
                                        child: Text(
                                      'Friend',
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      item,
                                      Container(
                                        child: Text(
                                          'Black',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 10,
                                              overflow:
                                                  TextOverflow.ellipsis),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Kasema',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 10,
                                              overflow:
                                                  TextOverflow.ellipsis),
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
                  delegate: SliverChildBuilderDelegate(
                      //   scrollDirection: Axis.vertical,
                      //  itemCount: chat_tiles.length,
                      (context, _index) {
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
        FeedUi()
      ]),
    );
  }

  onDismissed(int index, SlideAction action) {
    setState(() {
      chat_tiles.removeAt(index);
    });
  }
}*/
