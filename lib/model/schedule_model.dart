
class ScheduleModel {
  MRData? mRData;

  ScheduleModel({this.mRData});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    mRData =
    json['MRData'] != null ? new MRData.fromJson(json['MRData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mRData != null) {
      data['MRData'] = this.mRData!.toJson();
    }
    return data;
  }
}

class MRData {
  String? xmlns;
  String? series;
  String? url;
  String? limit;
  String? offset;
  String? total;
  RaceTable? raceTable;

  MRData(
      {this.xmlns,
        this.series,
        this.url,
        this.limit,
        this.offset,
        this.total,
        this.raceTable});

  MRData.fromJson(Map<String, dynamic> json) {
    xmlns = json['xmlns'];
    series = json['series'];
    url = json['url'];
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    raceTable = json['RaceTable'] != null
        ? new RaceTable.fromJson(json['RaceTable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xmlns'] = this.xmlns;
    data['series'] = this.series;
    data['url'] = this.url;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['total'] = this.total;
    if (this.raceTable != null) {
      data['RaceTable'] = this.raceTable!.toJson();
    }
    return data;
  }
}

class RaceTable {
  String? season;
  List<Races>? races;

  RaceTable({this.season, this.races});

  RaceTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    if (json['Races'] != null) {
      races = <Races>[];
      json['Races'].forEach((v) {
        races!.add(new Races.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    if (this.races != null) {
      data['Races'] = this.races!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Races {
  String? season;
  String? round;
  String? url;
  String? raceName;
  Circuit? circuit;
  String? date;
  String? time;
  FirstPractice? firstPractice;
  FirstPractice? secondPractice;
  FirstPractice? thirdPractice;
  FirstPractice? qualifying;
  FirstPractice? sprint;

  Races(
      {this.season,
        this.round,
        this.url,
        this.raceName,
        this.circuit,
        this.date,
        this.time,
        this.firstPractice,
        this.secondPractice,
        this.thirdPractice,
        this.qualifying,
        this.sprint});

  Races.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    url = json['url'];
    raceName = json['raceName'];
    circuit =
    json['Circuit'] != null ? new Circuit.fromJson(json['Circuit']) : null;
    date = json['date'];
    time = json['time'];
    firstPractice = json['FirstPractice'] != null
        ? new FirstPractice.fromJson(json['FirstPractice'])
        : null;
    secondPractice = json['SecondPractice'] != null
        ? new FirstPractice.fromJson(json['SecondPractice'])
        : null;
    thirdPractice = json['ThirdPractice'] != null
        ? new FirstPractice.fromJson(json['ThirdPractice'])
        : null;
    qualifying = json['Qualifying'] != null
        ? new FirstPractice.fromJson(json['Qualifying'])
        : null;
    sprint = json['Sprint'] != null
        ? new FirstPractice.fromJson(json['Sprint'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['round'] = this.round;
    data['url'] = this.url;
    data['raceName'] = this.raceName;
    if (this.circuit != null) {
      data['Circuit'] = this.circuit!.toJson();
    }
    data['date'] = this.date;
    data['time'] = this.time;
    if (this.firstPractice != null) {
      data['FirstPractice'] = this.firstPractice!.toJson();
    }
    if (this.secondPractice != null) {
      data['SecondPractice'] = this.secondPractice!.toJson();
    }
    if (this.thirdPractice != null) {
      data['ThirdPractice'] = this.thirdPractice!.toJson();
    }
    if (this.qualifying != null) {
      data['Qualifying'] = this.qualifying!.toJson();
    }
    if (this.sprint != null) {
      data['Sprint'] = this.sprint!.toJson();
    }
    return data;
  }
}

class Circuit {
  String? circuitId;
  String? url;
  String? circuitName;
  Location? location;

  Circuit({this.circuitId, this.url, this.circuitName, this.location});

  Circuit.fromJson(Map<String, dynamic> json) {
    circuitId = json['circuitId'];
    url = json['url'];
    circuitName = json['circuitName'];
    location = json['Location'] != null
        ? new Location.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['circuitId'] = this.circuitId;
    data['url'] = this.url;
    data['circuitName'] = this.circuitName;
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? lat;
  String? long;
  String? locality;
  String? country;

  Location({this.lat, this.long, this.locality, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    locality = json['locality'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['locality'] = this.locality;
    data['country'] = this.country;
    return data;
  }
}

class FirstPractice {
  String? date;
  String? time;

  FirstPractice({this.date, this.time});

  FirstPractice.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}