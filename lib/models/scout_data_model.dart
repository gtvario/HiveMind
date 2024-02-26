import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hivemind/models/score_event.dart';
import 'package:path_provider/path_provider.dart';

class ScoutData {
  // Auton
  List<double> startingPos = [0, 0];
  List<double> startingPosNormalized = [0, 0];
  int leaveZone = 0;
  int autoSpeakerMade = 0;
  int autoAmpMade = 0;
  List<int> fieldPickupAuto = [0, 0, 0, 0, 0, 0, 0, 0];

  // Teleop
  int trapsScored = 0;
  int notesPassed = 0;
  int teleopSpeakerMade = 0;
  int teleopAmpMade = 0;
  int teleopSpeakerMissed = 0;
  int teleopAmpMissed = 0;
  List<ScoreEvent> teleopEvents = [];

  // Endgame
  String chainHang = "";
  String condition = "";
  String comments = "";
  int defenseScore = 2, defenseAgainstScore = 2, drivingScore = 2;
  bool playedDefense = false;
  bool defensePlayedAgainst = false;

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

  List<double> get getStartingPosNormalized {
    return startingPosNormalized;
  }

  bool get getLeaveZone {
    if (leaveZone == 0) {
      return false;
    }
    return true;
  }

  int get getAutoSpeakerMade {
    return autoSpeakerMade;
  }

  int get getAutoAmpMade {
    return autoAmpMade;
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

  set setStartingPosNormalized(List<double> argIn) {
    startingPosNormalized = argIn;
  }

  set setLeaveZone(bool argIn) {
    leaveZone = argIn == false ? 0 : 1;
  }

  set setAutoSpeakerMade(int argIn) {
    autoSpeakerMade = argIn;
  }

  set setAutoAmpMade(int argIn) {
    autoAmpMade = argIn;
  }

  set setFieldPickupAuto(List<int> argIn) {
    fieldPickupAuto[argIn[0]] = argIn[1];
  }

  // **************************
  // Teleop Getters
  // **************************
  int get getTrapsScored {
    return trapsScored;
  }

  int get getNotesPassed {
    return notesPassed;
  }

  int get getTeleopSpeakerMade {
    return teleopSpeakerMade;
  }

  int get getTeleopAmpMade {
    return teleopAmpMade;
  }

  int get getTeleopSpeakerMissed {
    return teleopSpeakerMissed;
  }

  int get getTeleopAmpMissed {
    return teleopAmpMissed;
  }

  List<ScoreEvent> get getTeleopEvents {
    return teleopEvents;
  }

  // ***************************
  // Teleop Setters
  // ***************************
  set setNotesPassed(int argIn) {
    notesPassed = argIn;
  }

  set setTrapsScored(int argIn) {
    trapsScored = argIn;
  }

  set setTeleopSpeakerMade(int argIn) {
    teleopSpeakerMade = argIn;
  }

  set setTeleopAmpMade(int argIn) {
    teleopAmpMade = argIn;
  }

  set setTeleopSpeakerMissed(int argIn) {
    teleopSpeakerMissed = argIn;
  }

  set setTeleopAmpMissed(int argIn) {
    teleopAmpMissed = argIn;
  }

  set setTeleopEvents(List<ScoreEvent> eventList) {
    teleopEvents = eventList;
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

  int get getDefenseAgainstScore {
    return defenseAgainstScore;
  }

  int get getDriveScore {
    return drivingScore;
  }

  bool get getPlayedDefense {
    return playedDefense;
  }

  bool get getDefensePlayedAgainst {
    return defensePlayedAgainst;
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

  set setDefenseAgainstScore(int argIn) {
    defenseAgainstScore = argIn;
  }

  set setDriveScore(int driveScore) {
    drivingScore = driveScore;
  }

  set setPlayedDefense(bool playDefense) {
    playedDefense = playDefense;
  }

  set setDefensePlayedAgainst(bool argIn) {
    defensePlayedAgainst = argIn;
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
        "start_position": startingPosNormalized,
        "leave_start_zone": leaveZone,
        "auto_speaker_made": autoSpeakerMade,
        "auto_amp_made": autoAmpMade,
        "field_pickup_auto": fieldPickupAuto
      },
      "teleop": {
        "notes_passed": notesPassed,
        "traps_scored": trapsScored,
        "teleop_speaker_made": teleopSpeakerMade,
        "teleop_speaker_missed": teleopSpeakerMissed,
        "teleop_amp_made": teleopAmpMade,
        "teleop_amp_missed": teleopAmpMissed,
        "zone1_made": 0,
        "zone1_miss": 0,
        "zone2_made": 0,
        "zone2_miss": 0,
        "zone3_made": 0,
        "zone3_miss": 0,
        "zone5_made": 0,
        "zone5_miss": 0,
        "zone6_made": 0,
        "zone6_miss": 0,
        "zone7_made": 0,
        "zone7_miss": 0,
      },
      "endgame": {
        "chain_hang": chainHang,
        "robot_condition": condition,
        "defense_played": playedDefense,
        "defense_score": defenseScore,
        "defense_against": defensePlayedAgainst,
        "defense_against_score": defenseAgainstScore,
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

  parseEvents(List<ScoreEvent> eventList) {
    var obj = {};
    eventList.forEach((element) {
      obj.addEntries(element.getJson());
    });
    return obj;
  }
}
