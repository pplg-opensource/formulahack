import 'dart:async';

import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static const _images = <String>[
    'assets/images_intro/Frame1.png',
    'assets/images_intro/Frame2.png',
    'assets/images_intro/Frame3.png'
  ];

  Timer? timer;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 3500), (timer) {
      if (index < _images.length) {
        setState(() {
          index++;
          print(index);
        });
      }

      if (index == _images.length) {
        setState(() {
          index = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(fit: StackFit.passthrough, children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 2),
            child: Image.asset(
              width: double.infinity,
              key: ValueKey(_images[index]),
              _images[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: EdgeInsets.all(25),
              height: screenHeight,
              width: screenWidth,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 520),
                    Text("Welcome to Your",
                        style: TextStyle(color: Colors.white, fontSize: 28)),
                    SizedBox(height: 5),
                    Text("Formula Hack App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900)),
                    SizedBox(height: 20),
                    Text("Drivers | Teams | Result",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Container(
                      width: screenWidth,
                      height: 55,
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(left: 35, right: 35),
                      child: Container(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  primary: Color(0xFFFF1801)),
                              child: Text(
                                "LETS START",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
