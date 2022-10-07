import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';

class TabResults extends StatefulWidget {
  const TabResults({super.key});

  @override
  State<TabResults> createState() => _TabResultsState();
}

class _TabResultsState extends State<TabResults> {
  String? drdValue;
  final List<DropdownMenuItem<String>> _drItem = [
    DropdownMenuItem(
        child: Text("1", style: TextStyle(color: Colors.white)),
        value: "drd 1"),
    DropdownMenuItem(
        child: Text("2", style: TextStyle(color: Colors.white)),
        value: "drd 2"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: drdValue,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                hint: Text(
                  "Current Season",
                  style: TextStyle(color: Colors.white),
                ),
                items: _drItem,
                onChanged: (String? value) {
                  setState(() {
                    drdValue = value;
                  });
                },
              ),
            ),
            // SizedBox(height: 6),
            ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                          "Bahrain",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 7),

                        // driver 1
                        _driverStats("Charles", "Leclerc", "1", "26"),
                        SizedBox(height: 7),
                        // driver 2
                        _driverStats("Carlos", "Sainz", "2", "18")
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _driverStats(
      String frontName, String backName, String position, String pts) {
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
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: pts, style: TextStyle(fontWeight: FontWeight.w600)),
                TextSpan(text: " pts"),
              ], style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ],
        )
      ],
    );
  }
}
