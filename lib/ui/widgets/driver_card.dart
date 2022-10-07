import 'package:flutter/material.dart';

class DriverCard extends StatefulWidget {
  int number;
  DriverCard({Key? key, required this.number}) : super(key: key);

  @override
  State<DriverCard> createState() => _DriverCardState();
}

class _DriverCardState extends State<DriverCard> {

  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
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
                  child: Text(widget.number.toString(), style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Charles Leclerec",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    Text("Ferrari",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Text("86",
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
