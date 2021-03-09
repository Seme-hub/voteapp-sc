import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:voteapp/home_page.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: 'semecity.png',
      nextScreen: FirstPage(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: height / 3,
    );
  }
}
