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
  int mobility = 0;

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

  // Endgame
  String endgameChargeStation = "Did Not Attempt", comments = "";
  int defenseScore = 3, drivingScore = 3;

  ScoutData({
    required this.autoChargeStation,
  });
}
