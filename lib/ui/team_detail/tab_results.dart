import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/model/constructor_driver_result_model.dart';

class TabResults extends StatefulWidget {
  TabResults({super.key, required this.result});
  RaceTable result;

  @override
  State<TabResults> createState() => _TabResultsState();
}

class _TabResultsState extends State<TabResults> {
  RaceTable? _raceTable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _raceTable = widget.result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Season ${_raceTable!.season}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            SizedBox(height: 14),
            ListView.builder(
                itemCount: _raceTable!.races!.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var round = _raceTable!.races![index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Round ${index + 1}",
                          style: const TextStyle(
                            color: ColorValues.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          round.circuit!.location!.country!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 7),

                        // driver 1
                        _driverStats(
                          round.results![0].driver!.givenName!,
                          round.results![0].driver!.familyName!,
                          round.results![0].position!,
                          round.results![0].points!,
                          round.results![0].status!,
                        ),
                        SizedBox(height: 7),
                        // driver 2
                        _driverStats(
                          round.results![1].driver!.givenName!,
                          round.results![1].driver!.familyName!,
                          round.results![1].position!,
                          round.results![1].points!,
                          round.results![1].status!,
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _driverStats(String frontName, String backName, String position,
      String pts, String status) {
    bool ptsCondition = int.parse(pts) != 0;

    return Row(
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(text: "$frontName "),
            TextSpan(
              text: backName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ], style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Position: "),
                TextSpan(
                    text: position,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ], style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
            ptsCondition
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: pts,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: " pts"),
                      ],
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  )
                : Text(status,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 13)),
          ],
        )
      ],
    );
  }
}
