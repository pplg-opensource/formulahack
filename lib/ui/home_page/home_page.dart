import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/home_page/driverStanding_card.dart';

import '../../model/constructor_model.dart';
import '../../model/driver_standing_model.dart';
import '../../service/api_service.dart';
import '../widgets/loading_team_card.dart';
import '../widgets/team_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoad = false;

  DriverModel? _driverModel;
  List<DriverStandings> _driver = [];

  Future getApi() async {
    _driverModel = await ApiService().getDriverStanding();
    _driver = _driverModel!
        .mRData!.standingsTable!.standingsLists![0].driverStandings!
        .toList();

    if (mounted) {
      setState(() {
        _isLoad = true;
      });
    }
    _standingModel = await ApiService().getTeam();
    _listTeam = _standingModel!
        .mRData!.standingsTable!.standingsLists![0].constructorStandings!
        .toList();
    setState(() {
      isLoading = true;
    });
  }

  ConstructorStandingModel? _standingModel;
  List<ConstructorStandings> _listTeam = [];

  bool isLoading = false;

  // Future getApi() async {
  //   // Team Standing
  //   _standingModel = await ApiService().getTeam();
  //   _listTeam = _standingModel!
  //       .mRData!.standingsTable!.standingsLists![0].constructorStandings!
  //       .toList();
  //   setState(() {
  //     isLoading = true;
  //   });
  // }

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
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      backgroundColor: ColorValues.primaryColor,
                      child: Icon(Icons.person),
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
                height: 125,
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
                    : Center(child: CircularProgressIndicator()),
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
                          image: AssetImage("assets/countries/spain.png")),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Round 6",
                          style: TextStyle(
                              color: ColorValues.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Spain",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "20-22 MAY 2022",
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
                margin: EdgeInsets.fromLTRB(0, 6, 20, 6),
                height: 45,
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 18,
                          child: Text("1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 45,
                            width: 45,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/drivers/sainz_front.png"),
                              backgroundColor: ColorValues.secondColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Charles ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("Ledrec",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text("Ferarri",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text("612",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          Text(" pts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 20, 6),
                height: 45,
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 18,
                          child: Text("1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 45,
                            width: 45,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/drivers/sainz_front.png"),
                              backgroundColor: ColorValues.secondColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Charles ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("Ledrec",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text("Ferarri",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text("612",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          Text(" pts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 20, 6),
                height: 45,
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 18,
                          child: Text("1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 45,
                            width: 45,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/drivers/sainz_front.png"),
                              backgroundColor: ColorValues.secondColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Charles ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text("Ledrec",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text("Ferarri",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text("612",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          Text(" pts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "See full standing",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white70),
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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const LoadingTeamCard();
                        },
                      ),
              ),
              Text(
                "See full standing",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white70),
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
