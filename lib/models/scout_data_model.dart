import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ScoutData {
  // Auton
  int startingPos = 0;
  bool leaveZone = false;
  int speakerCountAuto = 0;
  int ampCountAuto = 0;
  int missedSpeakerCountAuto = 0; // Do we need this??
  int missedAmpCountAuto = 0; // Do we need this??
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
  int get getStartingPos {
    return startingPos;
  }

  bool get getLeaveZone {
    return leaveZone;
  }

  int get getSpeakerCountAuto {
    return speakerCountAuto;
  }

  int get getAmpCountAuto {
    return ampCountAuto;
  }

  int get getMissedSpeakerCountAuto {
    return missedSpeakerCountAuto;
  }

  int get getMissedAmpCountAuto {
    return missedAmpCountAuto;
  }

  List<int> get getFieldPickupAuto {
    return fieldPickupAuto;
  }

// ***************************
// Auto Setters
// ***************************
  set setStartingPos(int argIn) {
    startingPos = argIn;
  }

  set setLeaveZone(bool argIn) {
    leaveZone = argIn;
  }

  set setSpeakerCountAuto(int argIn) {
    speakerCountAuto = argIn;
  }

  set setAmpCountAuto(int argIn) {
    ampCountAuto = argIn;
  }

  set setMissedSpeakerCountAuto(int argIn) {
    missedSpeakerCountAuto = argIn;
  }

  set setMissedAmpCountAuto(int argIn) {
    missedAmpCountAuto = argIn;
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
        "position": startingPos,
        "leave": leaveZone,
        "note_auto_speaker": speakerCountAuto,
        "note_auto_amp": ampCountAuto,
        "missed_speaker_auto": missedSpeakerCountAuto,
        "missed_amp_auto": missedAmpCountAuto,
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
