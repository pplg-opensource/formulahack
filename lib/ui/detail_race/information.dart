import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/specific_race_model.dart';
import '../../service/api_service.dart';

class InformationRacePage extends StatefulWidget {
  final String round;

  const InformationRacePage({Key? key, required this.round}) : super(key: key);

  @override
  State<InformationRacePage> createState() => _InformationRacePageState();
}

class _InformationRacePageState extends State<InformationRacePage> {
  SpecificRaceModel? _model;
  List<Races> _result = [];
  bool _isLoad = false;

  Future getApi() async {
    _model = await ApiService().getSpecificRace(widget.round);
    _result = _model!.mRData!.raceTable!.races!;

    setState(() {
      _isLoad = true;
    });
  }

  String _dateFormat(String date) {
    String result;

    date.isEmpty
        ? result = "empty"
        : result = DateFormat("EEE, dd MMM yyyy")
            .format(DateTime.tryParse(date) ?? DateTime.now());

    return result;
  }

  String _timeFormat(String date) {
    String result;

    date == "null null" || date.isEmpty
        ? result = "empty"
        : result = DateFormat("h:mm a")
            .format(DateTime.tryParse(date) ?? DateTime.now());

    return result;
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
        ? SingleChildScrollView(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Map",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/circuits/${_result[0].circuit!.circuitId}.png",
                      width: size.width * 0.7,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  _timeRace(
                    "First Practice",
                    _dateFormat("${_result[0].firstPractice!.date}"),
                    _timeFormat(
                        "${_result[0].firstPractice!.date} ${_result[0].firstPractice!.time}"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _timeRace(
                      "Second Practice",
                      _dateFormat("${_result[0].secondPractice!.date}"),
                      _timeFormat(
                          "${_result[0].secondPractice!.date} ${_result[0].secondPractice!.time}")),
                  const SizedBox(
                    height: 15,
                  ),
                  _timeRace(
                      "Third Practice",
                      _dateFormat(_result[0].thirdPractice?.date ?? ''),
                      _timeFormat(
                          "${_result[0].thirdPractice?.date} ${_result[0].thirdPractice?.time}")),
                  const SizedBox(
                    height: 15,
                  ),
                  _timeRace(
                      "Qualifying",
                      _dateFormat("${_result[0].firstPractice!.date}"),
                      _timeFormat(
                          "${_result[0].firstPractice!.date} ${_result[0].firstPractice!.time}")),
                  const SizedBox(
                    height: 15,
                  ),
                  _timeRace(
                      "Sprint",
                      _dateFormat(_result[0].sprint?.date ?? ''),
                      _timeFormat(
                          "${_result[0].sprint?.date} ${_result[0].sprint?.time}")),
                  const SizedBox(
                    height: 15,
                  ),
                  _timeRace(
                      "Race",
                      _dateFormat("${_result[0].firstPractice!.date}"),
                      _timeFormat(
                          "${_result[0].firstPractice!.date} ${_result[0].firstPractice!.time}")),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _timeRace(String title, String date, String clock) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          "$date\n$clock",
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
