import 'package:flutter/material.dart';
import 'package:formulahack/model/schedule_model.dart';
import 'package:formulahack/service/api_service.dart';
import 'package:formulahack/ui/widgets/loading_schedule_card.dart';
import 'package:formulahack/ui/widgets/schedule_card.dart';
import 'package:intl/intl.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  ScheduleModel? _model;
  List<Races> _races = [];
  bool _isLoaded = false;

  Future getApi() async {
    _model = await ApiService().getSchedule();
    _races = _model!.mRData!.raceTable!.races!
        .where((e) =>
            int.parse(DateFormat('MMdd').format(DateTime.parse(e.date!))) >
            int.parse(DateFormat('MMdd').format(DateTime.now())))
        .toList();

    if (mounted) {
      setState(() {
        _isLoaded = true;
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
        body: _isLoaded
            ? ListView.builder(
                itemCount: _races.length,
                itemBuilder: (_, index) {
                  var data = _races[index];
                  final date = DateTime.parse(data.date!);

                  return ScheduleCard(
                    flag: data.circuit!.location!.country!,
                    round: data.round!,
                    country: data.circuit!.location!.country!,
                    circuit: data.circuit!.circuitName!,
                    date: DateFormat('dd MMM yyyy').format(date),
                  );
                },
              )
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return const LoadingScheduleCard();
                },
              ));
  }
}
