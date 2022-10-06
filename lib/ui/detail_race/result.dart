import 'package:flutter/material.dart';
import 'package:formulahack/model/race_result_model.dart';
import 'package:formulahack/service/api_service.dart';

class ResultRacePage extends StatefulWidget {
  final String round;

  const ResultRacePage({Key? key, required this.round}) : super(key: key);

  @override
  State<ResultRacePage> createState() => _ResultRacePageState();
}

class _ResultRacePageState extends State<ResultRacePage> {
  RaceResultModel? _results;
  bool _isLoad = false;

  Future getApi() async {
    _results = await ApiService().getRaceResult(widget.round);
    print("round : " + _results!.mRData!.raceTable!.season!);
    setState(() {
      _isLoad = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return _isLoad
        ? Container(
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Race",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        _results?.mRData?.raceTable?.races?[0].results?.length,
                    itemBuilder: (_, index) {
                      var result = _results
                          ?.mRData?.raceTable?.races?[0].results?[index];

                      var driver = result!.driver;
                      var constructor = result.constructor!;

                      return Container(
                        width: size.width,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              result.position!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/drivers/${driver!.driverId}.png',
                                width: 45,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${driver.givenName} ${driver.familyName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  constructor.name!,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              result.time?.time ?? "DNF",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
