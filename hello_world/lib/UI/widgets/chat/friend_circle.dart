import 'package:flutter/material.dart';

class FriendsCircle extends StatelessWidget {
  const FriendsCircle();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 3),
        child: GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(15),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    color: Color(0xFFDAE4E8)),
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ))));
  }
}
