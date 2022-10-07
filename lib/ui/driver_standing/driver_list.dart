import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/widgets/driver_card.dart';

class DriverStanding extends StatefulWidget {
  const DriverStanding({Key? key}) : super(key: key);

  @override
  State<DriverStanding> createState() => _DriverStandingState();
}

class _DriverStandingState extends State<DriverStanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
            backgroundColor: Color(0xFF212121),
            elevation: 0,
            title: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    "Driver",
                    style: TextStyle(
                        color: ColorValues.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    " Standing",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            )),
        body: ListView.builder(
            itemCount: 44,
            itemBuilder: (BuildContext context, int index) {
              return DriverCard(number: (index + 1));
            }));
  }
}
