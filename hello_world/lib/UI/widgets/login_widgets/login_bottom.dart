import 'package:flutter/material.dart';

class Login_bottom extends StatelessWidget {
  final bool login;
  final Function() press;

  const Login_bottom(
    this.login,
    this.press,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account? " : "Already have an Account? ",
          style: TextStyle(color: Color(0xFF415155)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: TextStyle(
              color: Color(0xFF80DBF7),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
