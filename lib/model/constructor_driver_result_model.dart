class ConstructorDriverResultModel {
  MRData? mRData;

  ConstructorDriverResultModel({this.mRData});

  ConstructorDriverResultModel.fromJson(Map<String, dynamic> json) {
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
  String? constructorId;
  List<Races>? races;

  RaceTable({this.season, this.constructorId, this.races});

  RaceTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    constructorId = json['constructorId'];
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
    data['constructorId'] = this.constructorId;
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
  List<Results>? results;

  Races(
      {this.season,
      this.round,
      this.url,
      this.raceName,
      this.circuit,
      this.date,
      this.time,
      this.results});

  Races.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    url = json['url'];
    raceName = json['raceName'];
    circuit =
        json['Circuit'] != null ? new Circuit.fromJson(json['Circuit']) : null;
    date = json['date'];
    time = json['time'];
    if (json['Results'] != null) {
      results = <Results>[];
      json['Results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
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
    if (this.results != null) {
      data['Results'] = this.results!.map((v) => v.toJson()).toList();
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

class Results {
  String? number;
  String? position;
  String? positionText;
  String? points;
  Driver? driver;
  Constructor? constructor;
  String? grid;
  String? laps;
  String? status;
  Time? time;
  FastestLap? fastestLap;

  Results(
      {this.number,
      this.position,
      this.positionText,
      this.points,
      this.driver,
      this.constructor,
      this.grid,
      this.laps,
      this.status,
      this.time,
      this.fastestLap});

  Results.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    position = json['position'];
    positionText = json['positionText'];
    points = json['points'];
    driver =
        json['Driver'] != null ? new Driver.fromJson(json['Driver']) : null;
    constructor = json['Constructor'] != null
        ? new Constructor.fromJson(json['Constructor'])
        : null;
    grid = json['grid'];
    laps = json['laps'];
    status = json['status'];
    time = json['Time'] != null ? new Time.fromJson(json['Time']) : null;
    fastestLap = json['FastestLap'] != null
        ? new FastestLap.fromJson(json['FastestLap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['position'] = this.position;
    data['positionText'] = this.positionText;
    data['points'] = this.points;
    if (this.driver != null) {
      data['Driver'] = this.driver!.toJson();
    }
    if (this.constructor != null) {
      data['Constructor'] = this.constructor!.toJson();
    }
    data['grid'] = this.grid;
    data['laps'] = this.laps;
    data['status'] = this.status;
    if (this.time != null) {
      data['Time'] = this.time!.toJson();
    }
    if (this.fastestLap != null) {
      data['FastestLap'] = this.fastestLap!.toJson();
    }
    return data;
  }
}

class Driver {
  String? driverId;
  String? permanentNumber;
  String? code;
  String? url;
  String? givenName;
  String? familyName;
  String? dateOfBirth;
  String? nationality;

  Driver(
      {this.driverId,
      this.permanentNumber,
      this.code,
      this.url,
      this.givenName,
      this.familyName,
      this.dateOfBirth,
      this.nationality});

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    permanentNumber = json['permanentNumber'];
    code = json['code'];
    url = json['url'];
    givenName = json['givenName'];
    familyName = json['familyName'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverId'] = this.driverId;
    data['permanentNumber'] = this.permanentNumber;
    data['code'] = this.code;
    data['url'] = this.url;
    data['givenName'] = this.givenName;
    data['familyName'] = this.familyName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['nationality'] = this.nationality;
    return data;
  }
}

class Constructor {
  String? constructorId;
  String? url;
  String? name;
  String? nationality;

  Constructor({this.constructorId, this.url, this.name, this.nationality});

  Constructor.fromJson(Map<String, dynamic> json) {
    constructorId = json['constructorId'];
    url = json['url'];
    name = json['name'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['constructorId'] = this.constructorId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['nationality'] = this.nationality;
    return data;
  }
}

class Time {
  String? millis;
  String? time;

  Time({this.millis, this.time});

  Time.fromJson(Map<String, dynamic> json) {
    millis = json['millis'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['millis'] = this.millis;
    data['time'] = this.time;
    return data;
  }
}

class FastestLap {
  String? rank;
  String? lap;
  LapTime? lapTime;
  AverageSpeed? averageSpeed;

  FastestLap({this.rank, this.lap, this.lapTime, this.averageSpeed});

  FastestLap.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    lap = json['lap'];
    lapTime = json['Time'] != null ? new LapTime.fromJson(json['Time']) : null;
    averageSpeed = json['AverageSpeed'] != null
        ? new AverageSpeed.fromJson(json['AverageSpeed'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['lap'] = this.lap;
    if (this.lapTime != null) {
      data['Time'] = this.lapTime!.toJson();
    }
    if (this.averageSpeed != null) {
      data['AverageSpeed'] = this.averageSpeed!.toJson();
    }
    return data;
  }
}

class LapTime {
  String? time;

  LapTime({this.time});

  LapTime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    return data;
  }
}

class AverageSpeed {
  String? units;
  String? speed;

  AverageSpeed({this.units, this.speed});

  AverageSpeed.fromJson(Map<String, dynamic> json) {
    units = json['units'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['units'] = this.units;
    data['speed'] = this.speed;
    return data;
  }
}
