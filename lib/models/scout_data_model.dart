class ScoutData {
  // Auton
  String autoPreload = "none", autoChargeStation = "Did Not Attempt";
  List<int> scoreGridAuto = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  int mobility = 0,
      hpStationAuto = 0,
      fieldConeAuto = 0,
      fieldCubeAuto = 0,
      droppedAuto = 0;

  // Teleop
  List<int> scoreGridTeleop = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  int hpStationTeleop = 0,
      fieldConeTeleop = 0,
      fieldCubeTeleop = 0,
      droppedTeleop = 0;

  // Endgame
  String endgameChargeStation = "Did Not Attempt", comments = "";
  int defenseScore = 3, drivingScore = 3;

  ScoutData({
    required this.autoChargeStation,
  });
}
