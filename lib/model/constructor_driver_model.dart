class ConstructorDriverModel {
  MRData? mRData;

  ConstructorDriverModel({this.mRData});

  ConstructorDriverModel.fromJson(Map<String, dynamic> json) {
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
  DriverTable? driverTable;

  MRData(
      {this.xmlns,
      this.series,
      this.url,
      this.limit,
      this.offset,
      this.total,
      this.driverTable});

  MRData.fromJson(Map<String, dynamic> json) {
    xmlns = json['xmlns'];
    series = json['series'];
    url = json['url'];
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    driverTable = json['DriverTable'] != null
        ? new DriverTable.fromJson(json['DriverTable'])
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
    if (this.driverTable != null) {
      data['DriverTable'] = this.driverTable!.toJson();
    }
    return data;
  }
}

class DriverTable {
  String? season;
  String? constructorId;
  List<Drivers>? drivers;

  DriverTable({this.season, this.constructorId, this.drivers});

  DriverTable.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    constructorId = json['constructorId'];
    if (json['Drivers'] != null) {
      drivers = <Drivers>[];
      json['Drivers'].forEach((v) {
        drivers!.add(new Drivers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['constructorId'] = this.constructorId;
    if (this.drivers != null) {
      data['Drivers'] = this.drivers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drivers {
  String? driverId;
  String? permanentNumber;
  String? code;
  String? url;
  String? givenName;
  String? familyName;
  String? dateOfBirth;
  String? nationality;

  Drivers(
      {this.driverId,
      this.permanentNumber,
      this.code,
      this.url,
      this.givenName,
      this.familyName,
      this.dateOfBirth,
      this.nationality});

  Drivers.fromJson(Map<String, dynamic> json) {
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
