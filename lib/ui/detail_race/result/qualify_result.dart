import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:formulahack/common/color_values.dart';
import 'package:formulahack/model/qualify_result_model.dart';
import 'package:formulahack/service/api_service.dart';

class QualifyResultPage extends StatefulWidget {
  final String round;

  const QualifyResultPage({Key? key, required this.round}) : super(key: key);

  @override
  State<QualifyResultPage> createState() => _QualifyResultPageState();
}

class _QualifyResultPageState extends State<QualifyResultPage> {
  QualifyResultModel? _model;
  List<Races> _races = [];
  bool _isLoad = false;
  final int _page = 2;

  Future getApi() async {
    _model = await ApiService().getQualifyResult(widget.round);
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
            ? SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _model
                      ?.mRData?.raceTable?.races?[0].qualifyingResults?.length,
                  itemBuilder: (_, index) {
                    var result = _model?.mRData?.raceTable?.races?[0]
                        .qualifyingResults?[index];

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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _textRich("1", result.q1 ?? "Empty"),
                                    _textRich("2", result.q2 ?? "Empty"),
                                    _textRich("3", result.q2 ?? "Empty"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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

  Widget _raceTypeDialog() {
    return Dialog(
      backgroundColor: ColorValues.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Race types",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Race",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Qualification",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: const Text(
                  "Sprint",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textRich(String title, String time) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "Q$title: ",
        style: _flTitle(),
      ),
      TextSpan(
        text: time,
        style: _flContent(),
      ),
    ]));
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
      fontWeight: FontWeight.w800,
    );
  }
}
