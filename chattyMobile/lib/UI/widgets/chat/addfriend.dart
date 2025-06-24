import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {
  const AddFriend();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFDAE4E8),
            border: Border.all(
                width: 2, color: Color(0xFFDAE4E8), style: BorderStyle.solid),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
