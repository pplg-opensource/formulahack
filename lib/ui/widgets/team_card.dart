import 'package:flutter/material.dart';
import 'package:formulahack/ui/team_detail/team_detail_tabbar.dart';

class TeamCard extends StatelessWidget {
  TeamCard(
      {super.key,
      required this.index,
      required this.teamName,
      required this.driver1,
      required this.driver2,
      required this.numPts});
  String teamName, driver1, driver2;
  int index, numPts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => TeamDetailTabbar())));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Text(
              (index + 1).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(width: 9),
            Container(
              width: 5,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 1),
                Text(
                  "$driver1 | $driver2",
                  style: TextStyle(color: Color(0xffA4A4A4), fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: numPts.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                  const TextSpan(
                      text: " pts",
                      style: TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
