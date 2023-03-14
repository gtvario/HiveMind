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
      droppedAutoCone = 0,
      droppedAutoCube = 0;

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
      droppedTeleopCone = 0,
      droppedTeleopCube = 0;

  // Endgame
  String endgameChargeStation = "Did Not Attempt",
      robotCondition = "",
      comments = "";
  int defenseScore = 3, drivingScore = 3;
  bool playedDefense = false;

  int matchNum = 0;
  String teamNum = "", eventKey = "";

  ScoutData(int matchNum, String teamNum, String eventKey) {
    matchNum = matchNum;
    teamNum = teamNum;
    eventKey = eventKey;
  }

  String get getAutoPreload {
    return autoPreload;
  }

  String get getAutoChargeStation {
    return autoChargeStation;
  }

  List<int> get getAutoGrid {
    return scoreGridAuto;
  }

  int get getMobility {
    return mobility;
  }

  int get getHPStationAuto {
    return hpStationAuto;
  }

  int get getFieldConeAuto {
    return fieldConeAuto;
  }

  int get getFieldCubeAuto {
    return fieldCubeAuto;
  }

  int get getDroppedAutoCone {
    return droppedAutoCone;
  }

  int get getDroppedAutoCube {
    return droppedAutoCube;
  }

  List<int> get getTeleopGrid {
    return scoreGridTeleop;
  }

  int get getHPStationTeleop {
    return hpStationTeleop;
  }

  int get getFieldConeTeleop {
    return fieldConeTeleop;
  }

  int get getFieldCubeTeleop {
    return fieldCubeTeleop;
  }

  int get getDroppedTeleopCone {
    return droppedTeleopCone;
  }

  int get getDroppedTeleopCube {
    return droppedTeleopCube;
  }

  String get getEndgameChargeStation {
    return endgameChargeStation;
  }

  String get getRobotCondition {
    return robotCondition;
  }

  String get getComments {
    return comments;
  }

  int get getDefenseScore {
    return defenseScore;
  }

  int get getDriveScore {
    return drivingScore;
  }

  bool get getPlayedDefense {
    return playedDefense;
  }
}
