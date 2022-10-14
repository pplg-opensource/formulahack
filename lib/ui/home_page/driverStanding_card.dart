import 'package:flutter/material.dart';

import '../../common/color_values.dart';

class DriverStanding_Card extends StatefulWidget {
  int number;
  String givenName, familyName, constName, nameId;

  DriverStanding_Card({
    Key? key,
    required this.number,
    required this.givenName,
    required this.familyName,
    required this.constName,
    required this.nameId,
  }) : super(key: key);

  // DriverStanding_Card({Key? key}) : super(key: key);

  @override
  State<DriverStanding_Card> createState() => _DriverStanding_CardState();
}

class _DriverStanding_CardState extends State<DriverStanding_Card> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 16, right: 10),
      padding: EdgeInsets.fromLTRB(10, 5, 8, 0),
      height: 125,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: ColorValues.secondColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.number.toString(),
                style: TextStyle(
                    color: ColorValues.primaryColor,
                    fontSize: 45,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.givenName} ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.familyName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Text(
                widget.constName,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Spacer(),
          Container(
            width: 80,
            child:
                Image(image: AssetImage("assets/drivers/${widget.nameId}.png")),
          )
        ],
      ),
    );
  }
}
