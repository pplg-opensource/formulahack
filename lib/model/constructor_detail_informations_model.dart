class ConstructorDetailInformationsModel {
  String? teamName;
  String? base;
  String? teamChief;
  String? chasis;
  String? powerUnit;
  String? highestRaceFinish;
  int? polePositions;
  int? fastestLaps;
  int? firstTeamEntry;
  int? worldChampions;

  ConstructorDetailInformationsModel({
    required this.teamName,
    required this.base,
    required this.teamChief,
    required this.chasis,
    required this.powerUnit,
    required this.highestRaceFinish,
    required this.polePositions,
    required this.fastestLaps,
    required this.firstTeamEntry,
    required this.worldChampions,
  });
}

Map<String, ConstructorDetailInformationsModel> constructorDetailInformations =
    {
  "alfa": ConstructorDetailInformationsModel(
      teamName: "Alfa Romeo F1 Team Orlen",
      base: "Hinwil, Zürich, Switzerland",
      teamChief: "Jan Monchaux",
      chasis: "C42",
      powerUnit: "Ferrari",
      highestRaceFinish: "",
      polePositions: 12,
      fastestLaps: 15,
      firstTeamEntry: 1950,
      worldChampions: 0),
  "alphatauri": ConstructorDetailInformationsModel(
      teamName: "Scuderia AlphaTauri",
      base: "Faenza, Italy",
      teamChief: "Jody Egginton",
      chasis: "AT03",
      powerUnit: "Red Bull",
      highestRaceFinish: "",
      polePositions: 0,
      fastestLaps: 1,
      firstTeamEntry: 2020,
      worldChampions: 0),
  "alpine": ConstructorDetailInformationsModel(
      teamName: "BWT Alpine F1 Team",
      base: "Enstone, England",
      teamChief: "Pat Fry / Matt Harman",
      chasis: "A522",
      powerUnit: "Renault",
      highestRaceFinish: "",
      polePositions: 0,
      fastestLaps: 0,
      firstTeamEntry: 2021,
      worldChampions: 0),
  "aston_martin": ConstructorDetailInformationsModel(
      teamName: "Aston Martin Aramco Cognizant F1 Team",
      base: "Silverstone, England, UK",
      teamChief: "Andrew Green / Dan Fallows",
      chasis: "AMR22",
      powerUnit: "Mercedes",
      highestRaceFinish: "",
      polePositions: 0,
      fastestLaps: 0,
      firstTeamEntry: 1959,
      worldChampions: 0),
  "ferrari": ConstructorDetailInformationsModel(
      teamName: "Scuderia Ferrari",
      base: "Maranello, Province of Modena, Italy",
      teamChief: "Enrico Cardile / Enrico Gualtieri",
      chasis: "F1-75",
      powerUnit: "Ferrari",
      highestRaceFinish: "1 (x243)",
      polePositions: 241,
      fastestLaps: 258,
      firstTeamEntry: 1950,
      worldChampions: 16),
  "haas": ConstructorDetailInformationsModel(
      teamName: "Haas F1 Team",
      base: "Kannapolis, North Carolina, United States",
      teamChief: "Simone Resta",
      chasis: "VF-22",
      powerUnit: "Ferrari",
      highestRaceFinish: "",
      polePositions: 0,
      fastestLaps: 2,
      firstTeamEntry: 2016,
      worldChampions: 0),
  "mclaren": ConstructorDetailInformationsModel(
      teamName: "McLaren F1 Team",
      base: "Surrey, England, UK",
      teamChief: "Zak Brown / James Key",
      chasis: "MCL36",
      powerUnit: "Mercedes",
      highestRaceFinish: "",
      polePositions: 156,
      fastestLaps: 161,
      firstTeamEntry: 1966,
      worldChampions: 8),
  "mercedes": ConstructorDetailInformationsModel(
      teamName: "Mercedes-AMG Petronas F1 Team",
      base: "Brackley, Northamptonshire, United Kingdom",
      teamChief: "James Alison / Mike Elliott",
      chasis: "F1 W13",
      powerUnit: "Mercedes",
      highestRaceFinish: "",
      polePositions: 136,
      fastestLaps: 97,
      firstTeamEntry: 1954,
      worldChampions: 8),
  "red_bull": ConstructorDetailInformationsModel(
      teamName: "Oracle Red Bull Racing",
      base: "Milton Keynes, England, UK",
      teamChief: "Andrian Newey / Pierre Wache",
      chasis: "RB18",
      powerUnit: "Red Bull",
      highestRaceFinish: "",
      polePositions: 79,
      fastestLaps: 84,
      firstTeamEntry: 2005,
      worldChampions: 4),
  "williams": ConstructorDetailInformationsModel(
      teamName: "Williams Racing",
      base: "Grove, Oxfordshire, England, UK",
      teamChief: "François-Xavier Demaison",
      chasis: "FW44",
      powerUnit: "Mercedes",
      highestRaceFinish: "",
      polePositions: 128,
      fastestLaps: 133,
      firstTeamEntry: 1977,
      worldChampions: 9),
};
