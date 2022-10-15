import 'package:flutter/material.dart';
import 'package:formulahack/ui/detail_race/detail_race.dart';

import '../../common/color_values.dart';

class NextRaceCard extends StatelessWidget {
  String flag, round, country, circuit, date;
  bool isPast;

  NextRaceCard(
      {Key? key,
      required this.flag,
      required this.round,
      required this.country,
      required this.circuit,
      required this.date,
      this.isPast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRacePage(round: round),
          ),
        );
      },
      //
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        height: 85,
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: ColorValues.secondColor,
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              child: Image(
                  image:
                      AssetImage('assets/countries/${flag.toLowerCase()}.png')),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Round $round',
                  style: TextStyle(
                      color: ColorValues.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  country,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
