import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formulahack/ui/bottom_navigation/bot_nav.dart';
import 'package:formulahack/ui/intro/start_page.dart';
import 'package:page_transition/page_transition.dart';

import '../detail_race/detail_race.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color baseColor = const Color(0xFF1A1A1A);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          PageTransition(child: StartPage(), type: PageTransitionType.fade));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: baseColor,
      body: Center(
        child: Container(
            height: 270,
            width: screenWidth,
            child: Image.asset('assets/images_intro/splash_formula.png')),
      ),
    );
  }
}
