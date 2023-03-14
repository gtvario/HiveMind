import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

  int? matchNum = 0, teamNum = 0;
  String? eventKey = "";

  String filePath = "";

  ScoutData(int? matchNum, int teamNum, String? eventKey) {
    matchNum = matchNum;
    teamNum = teamNum;
    eventKey = eventKey;

    filePath = "${eventKey}_Match${matchNum}_$teamNum.json";
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

  set setAutoPreload(String preload) {
    autoPreload = preload;
  }

  set setAutoChargeStation(String chargeStationAuto) {
    autoChargeStation = chargeStationAuto;
  }

  set setAutoGrid(List<int> autoGrid) {
    autoGrid = autoGrid;
  }

  set setMobility(int mobility) {
    mobility = mobility;
  }

  set setHPStationAuto(int hpAuto) {
    hpStationAuto = hpAuto;
  }

  set setFieldConeAuto(int fieldConeAuto) {
    fieldConeAuto = fieldConeAuto;
  }

  set setFieldCubeAuto(int fieldCubeAuto) {
    fieldCubeAuto = fieldCubeAuto;
  }

  set setDroppedAutoCone(int dropConeAuto) {
    droppedAutoCone = dropConeAuto;
  }

  set setDroppedAutoCube(int dropCubeAuto) {
    droppedAutoCube = dropCubeAuto;
  }

  set setTeleopGrid(List<int> teleopGrid) {
    scoreGridTeleop = teleopGrid;
  }

  set setHPStationTeleop(int hpTeleop) {
    hpStationTeleop = hpTeleop;
  }

  set setFieldConeTeleop(int fieldConeTeleop) {
    fieldConeTeleop = fieldConeTeleop;
  }

  set setFieldCubeTeleop(int fieldCubeTeleop) {
    fieldCubeTeleop = fieldCubeTeleop;
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

  set setComments(String comments) {
    comments = comments;
  }

  set setDefenseScore(int defenseScore) {
    defenseScore = defenseScore;
  }

  set setDriveScore(int driveScore) {
    drivingScore = driveScore;
  }

  set setPlayedDefense(bool playDefense) {
    playedDefense = playDefense;
  }

  writeFile() async {
    File matchFile = await _localFile;
  }

  readFile() async {
    File matchFile = await _localFile;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
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
