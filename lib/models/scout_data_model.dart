import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hivemind/models/match_scout_vars.dart';
import 'package:path_provider/path_provider.dart';

class ScoutData {
  // Auton
  String autoPreload = "none",
      autoChargeStation = "Did Not Attempt",
      startingPos = "NA";
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

  int? matchNum = 0, teamNum = 0;
  String? eventKey = "";

  String filePath = "";

  ScoutData(int? matchNum, int teamNum, String? event) {
    matchNum = matchNum;
    teamNum = teamNum;
    eventKey = event;

    filePath = "${eventKey}_Match${matchNum}_$teamNum.json";
    readFile();
  }

  String get getAutoPreload {
    return autoPreload;
  }

  String get getAutoChargeStation {
    return autoChargeStation;
  }

  String get getStartingPos {
    return startingPos;
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

  set setAutoPreload(String preload) {
    autoPreload = preload;
  }

  set setAutoChargeStation(String chargeStationAuto) {
    autoChargeStation = chargeStationAuto;
  }

  set setAutoGrid(List<int> autoGrid) {
    scoreGridAuto[autoGrid[0]] = autoGrid[1];
  }

  set setStartingPos(String startPos) {
    startingPos = startPos;
  }

  set setMobility(int autoMobility) {
    mobility = autoMobility;
  }

  set setHPStationAuto(int hpAuto) {
    hpStationAuto = hpAuto;
  }

  set setFieldConeAuto(int fieldAutoCone) {
    fieldConeAuto = fieldAutoCone;
  }

  set setFieldCubeAuto(int fieldAutoCube) {
    fieldCubeAuto = fieldAutoCube;
  }

  set setDroppedAutoCone(int dropConeAuto) {
    droppedAutoCone = dropConeAuto;
  }

  set setDroppedAutoCube(int dropCubeAuto) {
    droppedAutoCube = dropCubeAuto;
  }

  set setTeleopGrid(List<int> teleopGrid) {
    scoreGridTeleop[teleopGrid[0]] = teleopGrid[1];
  }

  set setHPStationTeleop(int hpTeleop) {
    hpStationTeleop = hpTeleop;
  }

  set setFieldConeTeleop(int fieldTeleopCone) {
    fieldConeTeleop = fieldTeleopCone;
  }

  set setFieldCubeTeleop(int fieldTeleopCube) {
    fieldCubeTeleop = fieldTeleopCube;
  }

  set setDroppedTeleopCone(int droppedConeTeleop) {
    droppedTeleopCone = droppedConeTeleop;
  }

  set setDroppedTeleopCube(int droppedCubeTeleop) {
    droppedTeleopCube = droppedCubeTeleop;
  }

  set setEndgameChargeStation(String endgameCharge) {
    endgameChargeStation = endgameCharge;
  }

  set setRobotCondition(String condition) {
    robotCondition = condition;
  }

  set setComments(String comment) {
    comments = comment;
  }

  set setDefenseScore(int defenseScores) {
    defenseScore = defenseScores;
  }

  set setDriveScore(int driveScore) {
    drivingScore = driveScore;
  }

  set setPlayedDefense(bool playDefense) {
    playedDefense = playDefense;
  }

  writeFile() async {
    File matchFile = await _localFile;

    var obj = {
      "auton": {
        "position": startingPos,
        "preload": autoPreload,
        "mobility": mobility,
        "score_grid_auto": scoreGridAuto,
        "charge_station": autoChargeStation,
        "hp_station_auto": hpStationAuto,
        "field_cone_auto": fieldConeAuto,
        "field_cube_auto": fieldCubeAuto,
        "dropped_cube_auto": droppedAutoCube,
        "dropped_cone_auto": droppedAutoCone
      },
      "teleop": {
        "score_grid_teleop": scoreGridTeleop,
        "hp_station_teleop": hpStationTeleop,
        "field_cone_teleop": fieldConeTeleop,
        "field_cube_teleop": fieldCubeTeleop,
        "dropped_cube_teleop": droppedTeleopCube,
        "dropped_cone_teleop": droppedTeleopCone
      },
      "endgame": {
        "charge_station": endgameChargeStation,
        "defense_played": playedDefense,
        "defense_score": defenseScore,
        "driving": drivingScore,
        "robot_status": robotCondition,
        "comments": comments
      }
    };

    String data = jsonEncode(obj);
    matchFile.writeAsString(data);
  }

  Future<void> readFile() async {
    File matchFile = await _localFile;

    var response = await matchFile.readAsString();
    while (response == "") {
      response = await matchFile.readAsString();
    }
    final data = await jsonDecode(response);
  }

  Future<String?> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory?.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var defaults = await rootBundle.load("assets/config/default_match.json");
    var matchFile = File('$path/$eventKey/$filePath');
    if (!await matchFile.exists()) {
      await matchFile.create(recursive: true);
      matchFile.writeAsBytes(
        defaults.buffer
            .asUint8List(defaults.offsetInBytes, defaults.lengthInBytes),
      );
    }
    return matchFile;
  }
}
