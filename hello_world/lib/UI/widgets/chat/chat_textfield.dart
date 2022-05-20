import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(60),
      child: TextField(
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          onChanged: (String val) {},
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 8, left: 24, bottom: 8),
                child: IconButton(
                  icon: Icon(Icons.search_rounded),
                  color: Colors.grey,
                  onPressed: () {},
                )),
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(top: 22, left: 15),
          )),
    );
  }
}
