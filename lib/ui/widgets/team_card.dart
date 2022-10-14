import 'package:flutter/material.dart';
import 'package:formulahack/model/constructor_driver_model.dart';
import 'package:formulahack/service/api_service.dart';
import 'package:formulahack/ui/team_detail/team_detail_tabbar.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';

class TeamCard extends StatefulWidget {
  TeamCard(
      {super.key,
      required this.index,
      required this.teamId,
      required this.teamName,
      required this.numPts});
  String teamId, teamName;
  int index, numPts;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  ConstructorDriverModel? _driverModel;
  List<Drivers> _listDriver = [];
  final Map<String, Color> _teamColor = const {
    "alfa": Color(0xffB12039),
    "alphatauri": Color(0xff4E7C9B),
    "alpine": Color(0xff2293D1),
    "aston_martin": Color(0xff2D826D),
    "ferrari": Color(0xffED1C24),
    "haas": Color(0xffB6BABD),
    "mclaren": Color(0xffF58020),
    "mercedes": Color(0xff6CD3BF),
    "red_bull": Color(0xff1E5BC6),
    "williams": Color(0xff37BEDD)
  };

  bool isLoading = false;

  Future getApi() async {
    // Team Standing
    _driverModel = await ApiService().getTeamDriver(widget.teamId);
    _listDriver = _driverModel!.mRData!.driverTable!.drivers!.toList();
    setState(() {
      isLoading = true;
    });
  }

  String driverName() {
    String allDriver = "";
    for (var i = 0; i < _listDriver.length; i++) {
      allDriver +=
          "${_listDriver[i].givenName.toString().substring(0, 1).toUpperCase()}. ${_listDriver[i].familyName}";
      if (i < _listDriver.length - 1) {
        allDriver += " | ";
      }
    }
    return allDriver;
  }

  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => TeamDetailTabbar(
                      constructorId: widget.teamId,
                      constructorName: widget.teamName,
                      allDriver: driverName(),
                    ))));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Text(
              (widget.index + 1).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(width: 9),
            Container(
              width: 5,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _teamColor[widget.teamId]),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.teamName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 1),
                isLoading
                    ? Text(
                        driverName(),
                        style: const TextStyle(
                            color: Color(0xffA4A4A4), fontSize: 12),
                      )
                    : const ShimmerWidget(height: 12, width: 100),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: widget.numPts.toString(),
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
