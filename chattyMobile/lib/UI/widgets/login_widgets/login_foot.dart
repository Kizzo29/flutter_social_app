import 'package:flutter/material.dart';

class LoginFoot extends StatelessWidget {
  const LoginFoot();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * 0.8,
      child: Row(
        children: <Widget>[
          ORDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Color(0xFF415155),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ORDivider(),
        ],
      ),
    );
  }
}

Expanded ORDivider() {
  return Expanded(
      child: Divider(
    color: Color(0xFFDEF5FC),
    height: 5,
  ));
}
