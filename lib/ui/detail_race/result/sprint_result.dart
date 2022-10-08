import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:formulahack/model/sprint_result_model.dart';
import 'package:formulahack/service/api_service.dart';

class SprintResultPage extends StatefulWidget {
  final String round;

  const SprintResultPage({Key? key, required this.round}) : super(key: key);

  @override
  State<SprintResultPage> createState() => _SprintResultPageState();
}

class _SprintResultPageState extends State<SprintResultPage> {
  SprintResultModel? _model;
  List<Races> _races = [];
  bool _isLoad = false;
  final int _page = 2;

  Future getApi() async {
    _model = await ApiService().getSprintResult(widget.round);
    _races = _model!.mRData!.raceTable!.races!;

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
        ? _races.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    _model?.mRData?.raceTable?.races?[0].sprintResults?.length,
                itemBuilder: (_, index) {
                  var result = _model
                      ?.mRData?.raceTable?.races?[0].sprintResults?[index];

                  var driver = result!.driver;
                  var constructor = result.constructor!;

                  return ExpandableNotifier(
                    child: Expandable(
                      collapsed: ExpandableButton(
                        child: Container(
                          width: size.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                result.position!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipOval(
                                child: Image.asset(
                                  'assets/drivers/${driver!.driverId}.png',
                                  width: 45,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${driver.givenName} ${driver.familyName}",
                                    style: const TextStyle(
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
                              const Spacer(),
                              Text(
                                result.time?.time ?? result.status!,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      expanded: ExpandableButton(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      result.position!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        'assets/drivers/${driver.driverId}.png',
                                        width: 45,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${driver.givenName} ${driver.familyName}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          constructor.name!,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      result.time?.time ?? result.status!,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Fastest lap",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Rank",
                                      style: _flTitle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Lap",
                                      style: _flTitle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Time",
                                      style: _flTitle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Average speed",
                                      style: _flTitle(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      result.position ?? "empty",
                                      style: _flContent(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      result.fastestLap?.lap ?? "empty",
                                      style: _flContent(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      result.fastestLap?.time?.time ?? "empty",
                                      style: _flContent(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container(
                height: size.height - 180,
                child: const Center(
                  child: Text(
                    "Empty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
        : Container(
            height: size.height - 180,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  TextStyle _flTitle() {
    return TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontSize: 12,
    );
  }

  TextStyle _flContent() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }
}
