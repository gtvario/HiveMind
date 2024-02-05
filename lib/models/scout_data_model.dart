import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ScoutData {
  // Auton
  List<double> startingPos = [0, 0];
  bool leaveZone = false;
  int autoSpeakerMade = 0;
  int autoAmpMade = 0;
  int autoSpeakerMissed = 0; // Do we need this??
  int autoAmpMissed = 0; // Do we need this??
  List<int> fieldPickupAuto = [0, 0, 0, 0, 0, 0, 0, 0];

  // Teleop

  // Endgame
  String chainHang = "";
  String condition = "";
  String comments = "";
  int defenseScore = 3, drivingScore = 3;
  bool playedDefense = false;

  int? matchNum = 0, teamNum = 0;
  String? eventKey = "";
  String studentName = "Select Student Name";

  String filePath = "";

  ScoutData(int? matchNum, int teamNum, String? event) {
    matchNum = matchNum;
    teamNum = teamNum;
    eventKey = event;

    filePath = "${eventKey}_Match${matchNum}_$teamNum.json";
    readFile();
  }

// ***************************
// Auto Getters
// ***************************
  List<double> get getStartingPos {
    return startingPos;
  }

  bool get getLeaveZone {
    return leaveZone;
  }

  int get getAutoSpeakerMade {
    return autoSpeakerMade;
  }

  int get getAutoAmpMade {
    return autoAmpMade;
  }

  int get getAutoSpeakerMissed {
    return autoSpeakerMissed;
  }

  int get getAutoAmpMissed {
    return autoAmpMissed;
  }

  List<int> get getFieldPickupAuto {
    return fieldPickupAuto;
  }

// ***************************
// Auto Setters
// ***************************
  set setStartingPos(List<double> argIn) {
    startingPos = argIn;
  }

  set setLeaveZone(bool argIn) {
    leaveZone = argIn;
  }

  set setAutoSpeakerMade(int argIn) {
    autoSpeakerMade = argIn;
  }

  set setAutoAmpMade(int argIn) {
    autoAmpMade = argIn;
  }

  set setAutoSpeakerMissed(int argIn) {
    autoSpeakerMissed = argIn;
  }

  set setAutoAmpMissed(int argIn) {
    autoAmpMissed = argIn;
  }

  set setFieldPickupAuto(List<int> argIn) {
    fieldPickupAuto[argIn[0]] = argIn[1];
  }

  // **************************
  // Endgame Getters
  // **************************
  String get getChainHang {
    return chainHang;
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

  String get getStudentName {
    return studentName;
  }

  String get getRobotCondition {
    return condition;
  }

  // **************************
  // Endgame Setters
  // **************************
  set setChainHang(String argIn) {
    chainHang = argIn;
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

  set setStudentName(String name) {
    studentName = name;
  }

  set setRobotCondition(String robotCondition) {
    condition = robotCondition;
  }

  writeFile() async {
    File matchFile = await _localFile;

    var obj = {
      "auton": {
        "start_position": startingPos,
        "leave_start_zone": leaveZone,
        "auto_speaker_made": autoSpeakerMade,
        "auto_amp_made": autoAmpMade,
        "auto_speaker_missed": autoSpeakerMissed,
        "auto_amp_missed": autoAmpMissed,
        "field_pickup_auto": fieldPickupAuto
      },
      "teleop": {},
      "endgame": {
        "chain_hang": chainHang,
        "robot_condition": condition,
        "defense_played": playedDefense,
        "defense_score": defenseScore,
        "driving": drivingScore,
        "comments": comments
      },
      "name": studentName
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
