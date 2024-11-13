import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hivemind/models/score_event.dart';
import 'package:path_provider/path_provider.dart';

class ScoutData {
  // Auton

  // Teleop

  // Endgame

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

// ***************************
// Auto Setters
// ***************************

// **************************
// Teleop Getters
// **************************

// ***************************
// Teleop Setters
// ***************************

// **************************
// Endgame Getters
// **************************

// **************************
// Endgame Setters
// **************************

  writeFile() async {
    File matchFile = await _localFile;
    var obj = {"auton": {}, "teleop": {}, "endgame": {}, "name": studentName};

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
