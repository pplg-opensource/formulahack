import 'dart:convert';

import 'package:formulahack/model/race_result_model.dart';
import 'package:formulahack/model/schedule_model.dart';
import 'package:formulahack/model/specific_race_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "http://ergast.com/api/f1/";

  Future getSchedule() async {
    const endPoint = "current.json";
    final url = "$baseUrl$endPoint";

    try {
      final response = await http.get(Uri.parse(url));

      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        ScheduleModel model = ScheduleModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getSpecificRace(String round) async {
    String endPoint = "2022/$round.json";
    final url = "$baseUrl$endPoint";

    try {
      final response = await http.get(Uri.parse(url));

      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        SpecificRaceModel model =
            SpecificRaceModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getRaceResult(String round) async {
    String endPoint = "2022/$round/results.json";
    final url = "$baseUrl$endPoint";

    try {
      final response = await http.get(Uri.parse(url));

      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        RaceResultModel model =
            RaceResultModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
