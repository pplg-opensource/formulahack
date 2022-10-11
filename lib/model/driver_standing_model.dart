class DriverModel {
  MRData? mRData;

  DriverModel({this.mRData});

  DriverModel.fromJson(Map<String, dynamic> json) {
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
  StandingsTable? standingsTable;

  MRData(
      {this.xmlns,
        this.series,
        this.url,
        this.limit,
        this.offset,
        this.total,
        this.standingsTable});

  MRData.fromJson(Map<String, dynamic> json) {
    xmlns = json['xmlns'];
    series = json['series'];
    url = json['url'];
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    standingsTable = json['StandingsTable'] != null
        ? new StandingsTable.fromJson(json['StandingsTable'])
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
    if (this.standingsTable != null) {
      data['StandingsTable'] = this.standingsTable!.toJson();
    }
    return data;
  }
}

class StandingsTable {
  String? season;
  List<StandingsLists>? standingsLists;

  StandingsTable({this.season, this.standingsLists});

  StandingsTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    if (json['StandingsLists'] != null) {
      standingsLists = <StandingsLists>[];
      json['StandingsLists'].forEach((v) {
        standingsLists!.add(new StandingsLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    if (this.standingsLists != null) {
      data['StandingsLists'] =
          this.standingsLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StandingsLists {
  String? season;
  String? round;
  List<DriverStandings>? driverStandings;

  StandingsLists({this.season, this.round, this.driverStandings});

  StandingsLists.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    if (json['DriverStandings'] != null) {
      driverStandings = <DriverStandings>[];
      json['DriverStandings'].forEach((v) {
        driverStandings!.add(new DriverStandings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['round'] = this.round;
    if (this.driverStandings != null) {
      data['DriverStandings'] =
          this.driverStandings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverStandings {
  String? position;
  String? positionText;
  String? points;
  String? wins;
  Driver? driver;
  List<Constructors>? constructors;

  DriverStandings(
      {this.position,
        this.positionText,
        this.points,
        this.wins,
        this.driver,
        this.constructors});

  DriverStandings.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    positionText = json['positionText'];
    points = json['points'];
    wins = json['wins'];
    driver =
    json['Driver'] != null ? new Driver.fromJson(json['Driver']) : null;
    if (json['Constructors'] != null) {
      constructors = <Constructors>[];
      json['Constructors'].forEach((v) {
        constructors!.add(new Constructors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['positionText'] = this.positionText;
    data['points'] = this.points;
    data['wins'] = this.wins;
    if (this.driver != null) {
      data['Driver'] = this.driver!.toJson();
    }
    if (this.constructors != null) {
      data['Constructors'] = this.constructors!.map((v) => v.toJson()).toList();
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

class Constructors {
  String? constructorId;
  String? url;
  String? name;
  String? nationality;

  Constructors({this.constructorId, this.url, this.name, this.nationality});

  Constructors.fromJson(Map<String, dynamic> json) {
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
