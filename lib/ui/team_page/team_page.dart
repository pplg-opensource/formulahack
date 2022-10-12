import 'package:flutter/material.dart';
import 'package:formulahack/model/constructor_model.dart';
import 'package:formulahack/service/api_service.dart';
import 'package:formulahack/ui/widgets/loading_team_card.dart';
import 'package:formulahack/ui/widgets/team_card.dart';
import 'package:formulahack/common/color_values.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  ConstructorStandingModel? _standingModel;
  List<ConstructorStandings> _listTeam = [];

  bool isLoading = false;

  Future getApi() async {
    // Team Standing
    _standingModel = await ApiService().getTeam();
    _listTeam = _standingModel!
        .mRData!.standingsTable!.standingsLists![0].constructorStandings!
        .toList();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Team",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorValues.primaryColor,
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: _listTeam.length,
              itemBuilder: (context, index) {
                final listTeam = _listTeam[index];
                return TeamCard(
                    index: index,
                    teamId: listTeam.constructor!.constructorId!,
                    teamName: listTeam.constructor!.name!,
                    numPts: int.parse(listTeam.points!));
              },
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const LoadingTeamCard();
              },
            ),
    );
  }
}
