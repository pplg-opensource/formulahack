import 'package:flutter/material.dart';

import '../../common/color_values.dart';

class InformationDriver extends StatefulWidget {
  const InformationDriver({Key? key}) : super(key: key);

  @override
  State<InformationDriver> createState() => _InformationDriverState();
}

class _InformationDriverState extends State<InformationDriver> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: ColorValues.secondColor,
        body: SingleChildScrollView(
          child: Container(
            height: heightScreen,
            width: widthScreen,
            padding: EdgeInsets.all(20),
            color: ColorValues.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basic Information",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: widthScreen,
                  margin: EdgeInsets.only(top: 12),
                  child:
                      contentText("Date of Birth", "16/10/1997 (24 years old)"),
                ),
                Container(
                  width: widthScreen,
                  margin: EdgeInsets.only(top: 12),
                  child: contentText("Place of Birth", "Monte Carlo, Monaco"),
                ),
                Container(
                  width: widthScreen,
                  margin: EdgeInsets.only(top: 12),
                  child: contentText("World Championship", "N/A"),
                ),
                Container(
                    width: widthScreen - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: contentText("Grand Prix", "92"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: contentText("Podiums", "18"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: contentText("Points", "730"),
                        ),
                      ],
                    )),
                Container(
                    width: widthScreen - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: contentText("Highest race finish", "1x (x5)"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: contentText("Highest grid position", "1"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

Widget contentText(String title, String data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400)),
      SizedBox(
        height: 5,
      ),
      Text(data,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800))
    ],
  );
}
