import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/message_screen/message_screen.dart';

class ChatTile extends StatefulWidget {
  const ChatTile();

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => MessageScreen())),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Stack(alignment: Alignment.center, children: [
                    Blob.fromID(
                      id: ['5-7-13895'],
                      size: 100,
                      styles: BlobStyles(
                          fillType: BlobFillType.stroke,
                          strokeWidth: 2,
                          color: Colors.black),
                    ),
                    Container(
                      width: 92,
                      height: 92,
                      child: ClipPath(
                          clipper: BlobClipper(id: '5-7-13895'),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              'assets/Black.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Black',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'This is the message.',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwipeToCall extends StatelessWidget {
  const SwipeToCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Icon(Icons.call))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Swipe to call >>>',
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
