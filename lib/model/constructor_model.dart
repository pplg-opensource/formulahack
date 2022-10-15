class ConstructorStandingModel {
  MRData? mRData;

  ConstructorStandingModel({this.mRData});

  ConstructorStandingModel.fromJson(Map<String, dynamic> json) {
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
  List<ConstructorStandings>? constructorStandings;

  StandingsLists({this.season, this.round, this.constructorStandings});

  StandingsLists.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    round = json['round'];
    if (json['ConstructorStandings'] != null) {
      constructorStandings = <ConstructorStandings>[];
      json['ConstructorStandings'].forEach((v) {
        constructorStandings!.add(new ConstructorStandings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['round'] = this.round;
    if (this.constructorStandings != null) {
      data['ConstructorStandings'] =
          this.constructorStandings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConstructorStandings {
  String? position;
  String? positionText;
  String? points;
  String? wins;
  Constructor? constructor;

  ConstructorStandings(
      {this.position,
      this.positionText,
      this.points,
      this.wins,
      this.constructor});

  ConstructorStandings.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    positionText = json['positionText'];
    points = json['points'];
    wins = json['wins'];
    constructor = json['Constructor'] != null
        ? new Constructor.fromJson(json['Constructor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['positionText'] = this.positionText;
    data['points'] = this.points;
    data['wins'] = this.wins;
    if (this.constructor != null) {
      data['Constructor'] = this.constructor!.toJson();
    }
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
