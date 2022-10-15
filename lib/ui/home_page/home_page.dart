import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/driver_standing/driver_list.dart';
import 'package:formulahack/ui/widgets/home_widget/driverStanding_card.dart';
import 'package:formulahack/ui/widgets/home_widget/loadingDriverSanding.dart';

import 'package:formulahack/ui/home_page/setting.dart';
import 'package:formulahack/ui/schedule/tab_bar.dart';
import 'package:formulahack/ui/team_page/team_page.dart';
import 'package:formulahack/ui/widgets/home_widget/loadingNextRace_Card.dart';
import 'package:formulahack/ui/widgets/home_widget/nextRace_card.dart';
import 'package:formulahack/ui/widgets/shimmer_widget.dart';
import 'package:intl/intl.dart';

import '../../model/constructor_model.dart';
import '../../model/driver_standing_model.dart';
import '../../model/schedule_model.dart';
import '../../service/api_service.dart';
import '../widgets/driver_widget/driver_card.dart';
import '../widgets/driver_widget/loading_driver_card.dart';
import '../widgets/loading_team_card.dart';
import '../widgets/team_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoad = false;

  ScheduleModel? _model;
  List<Races> _races = [];
  ConstructorStandingModel? _standingModel;
  List<ConstructorStandings> _listTeam = [];
  bool isLoading = false;

  DriverModel? _driverModel;
  List<DriverStandings> _driver = [];

  Future getApi() async {
    _driverModel = await ApiService().getDriverStanding();
    _driver = _driverModel!
        .mRData!.standingsTable!.standingsLists![0].driverStandings!
        .toList();

    _standingModel = await ApiService().getTeam();
    _listTeam = _standingModel!
        .mRData!.standingsTable!.standingsLists![0].constructorStandings!
        .toList();
    setState(() {
      isLoading = true;
    });

    _model = await ApiService().getSchedule();
    _races = _model!.mRData!.raceTable!.races!
        .where((e) =>
            int.parse(DateFormat('MMdd').format(DateTime.parse(e.date!))) >
            int.parse(DateFormat('MMdd').format(DateTime.now())))
        .toList();

    if (mounted) {
      setState(() {
        _isLoad = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Formula 1 Fan",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingPage(),
                          ));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundColor: ColorValues.primaryColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Latest Result",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                "Round 5 - USA",
                style: TextStyle(color: Colors.white70),
              ),
              Container(
                height: 140,
                width: screenWidth,
                child: _isLoad
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _driver.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DriverStanding_Card(
                            number: (index + 1),
                            givenName:
                                _driver[index].driver!.givenName.toString(),
                            familyName:
                                _driver[index].driver!.familyName.toString(),
                            constName:
                                _driver[index].constructors![0].name.toString(),
                            nameId: _driver[index].driver!.driverId.toString(),
                          );
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const LoadingDriverStanding();
                        },
                      ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Next Races",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: screenWidth,
                height: 85,
                child: _isLoad
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _races.length,
                        itemBuilder: (_, index) {
                          var data = _races[index];
                          final date = DateTime.parse(data.date!);

                          return NextRaceCard(
                            flag: data.circuit!.location!.country!,
                            round: data.round!,
                            country: data.circuit!.location!.country!,
                            circuit: data.circuit!.circuitName!,
                            date: DateFormat('dd MMM yyyy').format(date),
                          );
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const LoadingNextRace();
                        },
                      ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Driver Standings",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 170,
                width: screenWidth,
                child: _isLoad
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return DriverCard(
                            number: (index + 1),
                            givenName:
                                _driver[index].driver!.givenName.toString(),
                            familyName:
                                _driver[index].driver!.familyName.toString(),
                            constName:
                                _driver[index].constructors![0].name.toString(),
                            point: _driver[index].points.toString(),
                            nameId: _driver[index].driver!.driverId.toString(),
                          );
                        },
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return const LoadingDriverCard();
                        },
                      ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverStanding(),
                      ));
                },
                child: Text(
                  "See full standing",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Teams Standings",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4.4,
                width: screenWidth,
                child: isLoading
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const LoadingTeamCard();
                        },
                      ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamPage(),
                      ));
                },
                child: Text(
                  "See full standing",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
