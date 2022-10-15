import 'package:flutter/material.dart';
import 'package:formulahack/model/constructor_detail_informations_model.dart';

class TabInformations extends StatelessWidget {
  TabInformations({super.key, required this.constructorId});
  String? constructorId;

  @override
  Widget build(BuildContext context) {
    ConstructorDetailInformationsModel? informations =
        constructorDetailInformations[constructorId];
    bool _highestRaceFinishCondition = informations!.highestRaceFinish == "";

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic Informations",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(height: 22),
          _informationText("Team Name", informations.teamName!),
          SizedBox(height: 16),
          _informationText("Base", informations.base!),
          SizedBox(height: 16),
          _informationText("Team Chief", informations.teamChief!),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                  width: 163,
                  child: _informationText("Chasis", informations.chasis!)),
              SizedBox(
                  width: 163,
                  child:
                      _informationText("Power Unit", informations.powerUnit!)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                  width: 119,
                  child: _informationText(
                      "Highest Race Finish",
                      _highestRaceFinishCondition
                          ? "Unknown"
                          : informations.highestRaceFinish!)),
              SizedBox(
                  width: 119,
                  child: _informationText(
                      "Pole Positions", informations.polePositions.toString())),
              SizedBox(
                  width: 90,
                  child: _informationText(
                      "Fastest Laps", informations.fastestLaps.toString())),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                  width: 163,
                  child: _informationText("First team entry",
                      informations.firstTeamEntry.toString())),
              SizedBox(
                  width: 163,
                  child: _informationText("World Championships",
                      informations.worldChampions.toString())),
            ],
          ),
        ],
      ),
    );
  }

  Widget _informationText(String title, String fill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xffA6A6A6),
              fontWeight: FontWeight.w600,
              fontSize: 11),
        ),
        SizedBox(height: 5),
        Text(
          fill,
          style: TextStyle(
              color: Color.fromARGB(255, 237, 237, 237),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ],
    );
  }
}
