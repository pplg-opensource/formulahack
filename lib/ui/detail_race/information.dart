import 'package:flutter/material.dart';

class InformationRacePage extends StatefulWidget {
  final String map;
  final String fpDate, fpTime;
  final String spDate, spTime;
  final String tpDate, tpTime;
  final String qualifyDate, qualifyTime;
  final String raceDate, raceTime;

  const InformationRacePage(
      {Key? key,
      required this.map,
      required this.fpDate,
      required this.fpTime,
      required this.spDate,
      required this.spTime,
      required this.tpDate,
      required this.tpTime,
      required this.qualifyDate,
      required this.qualifyTime,
      required this.raceDate,
      required this.raceTime})
      : super(key: key);

  @override
  State<InformationRacePage> createState() => _InformationRacePageState();
}

class _InformationRacePageState extends State<InformationRacePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Map",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/circuits/${widget.map}.png",
              width: size.width * 0.7,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          _timeRace("First Practice", widget.fpDate, widget.fpTime),
          SizedBox(
            height: 15,
          ),
          _timeRace("Second Practice", widget.spDate, widget.spTime),
          SizedBox(
            height: 15,
          ),
          _timeRace("Third Practice", widget.tpDate, widget.tpTime),
          SizedBox(
            height: 15,
          ),
          _timeRace("Third Practice", widget.qualifyDate, widget.qualifyTime),
          SizedBox(
            height: 15,
          ),
          _timeRace("Race", widget.raceDate, widget.raceTime),
        ],
      ),
    );
  }

  Widget _timeRace(String title, String date, String clock) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          "$date\n$clock",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
