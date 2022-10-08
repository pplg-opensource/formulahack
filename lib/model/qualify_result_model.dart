class QualifyResultModel {
  MRData? mRData;

  QualifyResultModel({this.mRData});

  QualifyResultModel.fromJson(Map<String, dynamic> json) {
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
  String? round;
  List<Races>? races;

  RaceTable({this.season, this.round, this.races});

  RaceTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
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
    data['round'] = this.round;
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
  List<QualifyingResults>? qualifyingResults;

  Races(
      {this.season,
        this.round,
        this.url,
        this.raceName,
        this.circuit,
        this.date,
        this.time,
        this.qualifyingResults});

  Races.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    url = json['url'];
    raceName = json['raceName'];
    circuit =
    json['Circuit'] != null ? new Circuit.fromJson(json['Circuit']) : null;
    date = json['date'];
    time = json['time'];
    if (json['QualifyingResults'] != null) {
      qualifyingResults = <QualifyingResults>[];
      json['QualifyingResults'].forEach((v) {
        qualifyingResults!.add(new QualifyingResults.fromJson(v));
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
    if (this.qualifyingResults != null) {
      data['QualifyingResults'] =
          this.qualifyingResults!.map((v) => v.toJson()).toList();
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

class QualifyingResults {
  String? number;
  String? position;
  Driver? driver;
  Constructor? constructor;
  String? q1;
  String? q2;
  String? q3;

  QualifyingResults(
      {this.number,
        this.position,
        this.driver,
        this.constructor,
        this.q1,
        this.q2,
        this.q3});

  QualifyingResults.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    position = json['position'];
    driver =
    json['Driver'] != null ? new Driver.fromJson(json['Driver']) : null;
    constructor = json['Constructor'] != null
        ? new Constructor.fromJson(json['Constructor'])
        : null;
    q1 = json['Q1'];
    q2 = json['Q2'];
    q3 = json['Q3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['position'] = this.position;
    if (this.driver != null) {
      data['Driver'] = this.driver!.toJson();
    }
    if (this.constructor != null) {
      data['Constructor'] = this.constructor!.toJson();
    }
    data['Q1'] = this.q1;
    data['Q2'] = this.q2;
    data['Q3'] = this.q3;
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
