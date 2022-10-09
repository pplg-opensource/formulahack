import 'package:flutter/material.dart';

import '../../../common/color_values.dart';

class ResultCard extends StatefulWidget {
  int number;

  ResultCard({Key? key, required this.number}) : super(key: key);

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: widthScreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: widthScreen / 2 - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Round ",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorValues.primaryColor,
                                fontWeight: FontWeight.normal)),
                        Text(widget.number.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorValues.primaryColor,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Text("Bahrain",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w800))
                  ],
                ),
                Text("Ferari",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("Position: ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                  Text("1",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("26 ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800)),
                  Text("pts",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
