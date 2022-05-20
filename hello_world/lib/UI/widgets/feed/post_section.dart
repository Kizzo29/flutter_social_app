import 'dart:math';

import 'package:flutter/material.dart';

enum PostType { text, photo, video, audio, link }

class FeedPost {
  FeedPost({required this.post, required this.type});
  PostType type;
  String post;
}

class PostSection extends StatefulWidget {
  const PostSection();
  @override
  _PostSectionState createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  @override
  Widget build(BuildContext context) {
    List<FeedPost> _post = [
      FeedPost(type: PostType.text, post: ""),
      FeedPost(type: PostType.photo, post: ""),
      FeedPost(type: PostType.audio, post: ""),
      FeedPost(type: PostType.video, post: ""),
      FeedPost(type: PostType.text, post: "")
    ];
    return ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.only(top: 20),
        shrinkWrap: true,
        itemBuilder: (context, index) => _post[index].type == PostType.text
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.all(Radius.circular(48))),
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
                                  color: Color(0xFF011A43), fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This Text is here to check the widget layout and if childern fit properly",
                            style: TextStyle(color: Color(0xFF011A43)),
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              constraints:
                                  BoxConstraints(maxWidth: 130, maxHeight: 22),
                              decoration: BoxDecoration(
                                  color: Color(0xFFDAE4E8),
                                  borderRadius: BorderRadius.circular(8)),
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
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Text(
                                      "10 comments",
                                      style:
                                          TextStyle(color: Color(0xFF011A43)),
                                    ),
                                  ),
                                  Container(
                                    width: 95,
                                    height: 50,
                                    child: ListView.builder(
                                        itemCount: 2,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xFFDAE4E8),
                                                child: Icon(
                                                  Icons.person_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: GestureDetector(
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xFFDAE4E8),
                                        child: Center(
                                          child: Text(
                                            '100+',
                                            style:
                                                TextStyle(color: Colors.white),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                width: MediaQuery.of(context).size.width,
                                height: 500,
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: 25,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFDAE4E8),
                                      child: Icon(
                                        Icons.person_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8, top: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Username",
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        Text('2 minutes ago',
                                            style: TextStyle(
                                                color: Colors.white70))
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
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13, right: 5),
                                            child: Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "73K",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                          left: 15, right: 15, top: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13, right: 5),
                                            child: Icon(
                                              Icons.message_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "10K",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 30),
                                      width: 70,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 8, left: 10),
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
                                            style:
                                                TextStyle(color: Colors.white),
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
              ));
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
        ),
      );
}
