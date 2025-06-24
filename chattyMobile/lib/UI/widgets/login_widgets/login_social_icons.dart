import 'package:flutter/material.dart';

class LogInSocialIcons extends StatelessWidget {
  const LogInSocialIcons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: Row(
        children: <Widget>[
          Social_Icon(
            iconData: Icons.facebook_rounded,
            press: () {},
          ),
          Container(
            child: Social_Icon(
              iconData: Icons.mail_rounded,
              press: () {},
            ),
          ),
          Container(
            child: Social_Icon(
              iconData: Icons.facebook_rounded,
              press: () {},
            ),
          )
        ],
      ),
    );
  }
}

class Social_Icon extends StatelessWidget {
  final IconData? iconData;
  final Function()? press;

  const Social_Icon({
    Key? key,
    this.iconData,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Material(
        elevation: 5,
        shadowColor: Color(0xFFDEF5FC),
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: press,
          child: Icon(
            iconData,
            color: Color(0xFF011A43),
            size: 40,
          ),
        ),
      ),
    );
  }
}
