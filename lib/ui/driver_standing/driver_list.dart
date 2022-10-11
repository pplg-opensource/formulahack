import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/ui/widgets/driver_widget/driver_card.dart';

import '../../model/driver_standing_model.dart';
import '../../service/api_service.dart';

class DriverStanding extends StatefulWidget {
  const DriverStanding({Key? key}) : super(key: key);

  @override
  State<DriverStanding> createState() => _DriverStandingState();
}

class _DriverStandingState extends State<DriverStanding> {
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
            backgroundColor: Color(0xFF212121),
            elevation: 0,
            title: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    "Driver",
                    style: TextStyle(
                        color: ColorValues.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    " Standing",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            )),
        body: _isLoad
            ? ListView.builder(
                itemCount: _driver.length,
                itemBuilder: (BuildContext context, int index) {
                  return DriverCard(
                    number: (index + 1),
                    givenName: _driver[index].driver!.givenName.toString(),
                    familyName: _driver[index].driver!.familyName.toString(),
                    constName: _driver[index].constructors![0].name.toString(),
                    point: _driver[index].points.toString(),
                    nameId: _driver[index].driver!.driverId.toString(),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
