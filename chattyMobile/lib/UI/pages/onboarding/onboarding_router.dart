/*import 'package:flutter/material.dart';
import 'package:social_media/social_media.dart';

abstract class IOnboardingRouter {
  void onSessionSuccess(BuildContext context, User me);
}

class OnboardingRouter implements IOnboardingRouter {
  final Widget Function(User me) onSessionConnected;

  OnboardingRouter(this.onSessionConnected);

  @override
  void onSessionSuccess(BuildContext context, User me) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_) => onSessionConnected(me)),
    (Route<dynamic> route) => false);
  }
}*/
