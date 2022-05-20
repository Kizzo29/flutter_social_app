import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/UI/pages/chat_ui/new_chat.dart';

class NewChatBox extends StatelessWidget {
  const NewChatBox();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.rotate(
          angle: pi / 4,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 60,
              width: 60,
              padding: EdgeInsets.only(bottom: 4, right: 0.2),
              decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[3],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(22)),
              child: Center(
                child: Transform.rotate(
                  angle: pi / -1.92,
                  child: IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewChat(items: [
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
                    icon: Icon(Icons.send_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
