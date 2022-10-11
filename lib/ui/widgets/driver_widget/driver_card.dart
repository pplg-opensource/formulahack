import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/detail_driver/tab_bar.dart';

class DriverCard extends StatefulWidget {
  int number;
  String givenName, familyName, constName, point, nameId;

  DriverCard(
      {Key? key,
      required this.number,
      required this.givenName,
      required this.familyName,
      required this.constName,
      required this.point,
      required this.nameId})
      : super(key: key);

  @override
  State<DriverCard> createState() => _DriverCardState();
}

class _DriverCardState extends State<DriverCard> {

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailDriver(driverId: widget.nameId,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 45,
        width: widthSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 18,
                  child: Text(widget.number.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/drivers/${widget.nameId}_front.png"),
                      backgroundColor: ColorValues.secondColor,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("${widget.givenName} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        Text(widget.familyName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(widget.constName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w200))
                  ],
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Text(widget.point,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800)),
                  Text(" pts",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
