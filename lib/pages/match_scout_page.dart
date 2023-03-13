import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivemind/models/match_model.dart';
import 'package:hivemind/pages/auton_page.dart';
import 'package:hivemind/pages/endgame_page.dart';
import 'package:hivemind/pages/teleop_page.dart';
import 'package:path_provider/path_provider.dart';

class MatchScoutPage extends StatefulWidget {
  final String? station, studentName;
  final FRCMatch? match;
  const MatchScoutPage(
      {super.key,
      required this.station,
      required this.studentName,
      required this.match});

  @override
  State<MatchScoutPage> createState() => _MatchScoutPageState();
}

class _MatchScoutPageState extends State<MatchScoutPage> {
  final PageController pageController = PageController();
  int? stationNum = 0, team = 0;
  String? alliance = "";

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    List<String>? stationSplit =
        widget.station?.split(' '); //comes in "Alliance #"
    var allianceColor = stationSplit?.elementAt(0);
    String? stationNumStr = stationSplit?.elementAt(1);
    int stationNumber = 0;
    int curTeam;

    if (stationNumStr != null) {
      stationNumber = int.parse(stationNumStr) - 1;
    }

    if (allianceColor == "Blue") {
      curTeam = int.parse(
          widget.match?.blueAlliance?.elementAt(stationNumber).substring(3));
    } else if (allianceColor == "Red") {
      curTeam = int.parse(
          widget.match?.redAlliance?.elementAt(stationNumber).substring(3));
    } else {
      curTeam = -1;
    }

    // set up scouting file for specific team and match
    var curMatchFile = getMatchFile(curTeam);

    setState(() {
      alliance = allianceColor;
      stationNum = stationNumber;
      team = curTeam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Hivemind | Match ${widget.match?.matchNumber} | Team $team'),
        backgroundColor: alliance == "Blue"
            ? Colors.blue
            : alliance == "Red"
                ? Colors.red
                : Colors.black,
      ),
      body: PageView(
        controller: pageController,
        children: const [
          Center(
            child: AutonPage(),
          ),
          Center(
            child: TeleopPage(),
          ),
          Center(
            child: EndgamePage(),
          ),
        ],
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> getMatchFile(curTeam) async {
    final path = await _localPath;
    var defaults = await rootBundle.load("assets/config/default_match.json");
    var matchFile = File(
        '$path/${widget.match?.eventKey}/${widget.match?.eventKey}_Match${widget.match?.matchNumber}_$curTeam.json');
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
