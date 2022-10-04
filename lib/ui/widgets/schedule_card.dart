import 'package:flutter/material.dart';

import '../../common/color_values.dart';

class ScheduleCard extends StatelessWidget {
  String flag, round, country, circuit, date;
  bool isPast;

  ScheduleCard(
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

    return Container(
      width: size.width,
      height: size.height * 0.085,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // color: Colors.white,
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/countries/${flag.toLowerCase()}.png',
              width: 45,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Round $round',
                style: const TextStyle(
                  color: ColorValues.primaryColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              isPast
                  ? Text(
                      country,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  : SizedBox(
                      width: size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            country,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            date,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 1,
              ),
              Text(
                circuit,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
