import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hivemind/models/match_model.dart';

import 'dart:io' as io;

import 'package:hivemind/pages/match_scout_page.dart';
import 'package:path_provider/path_provider.dart';

class MatchListPage extends StatefulWidget {
  final String? eventKey;
  const MatchListPage({super.key, required this.eventKey});

  @override
  State<MatchListPage> createState() => _MatchListPageState();
}

class _MatchListPageState extends State<MatchListPage> {
  late io.File curJson, settingsContent;
  List<FRCMatch> hiveMatchList = [];
  List<String> events = [];

  String? studentName = "";
  String? station = "";

  Future<void> getMatches(eventKey) async {
    List<FRCMatch> qualMatchList = [];
    List<FRCMatch> sfMatchList = [];
    List<FRCMatch> finMatchList = [];
    List<FRCMatch> combinedList = [];
    FRCMatch curMatch;

    curJson = await _localFile(eventKey);
    final response = await curJson.readAsString();
    final re = RegExp('(?=\{\"event_key\":)');
    var list = response.split(re);
    for (var item in list) {
      item = item.replaceAll(RegExp(',?\n?\$'),
          ""); // Remove newlines and commas from the end of the string
      if (item.endsWith(',')) {
        item = item.substring(0, item.length - 1);
      }

      curMatch = FRCMatch.fromProcessedJson(jsonDecode(item));

      switch (curMatch.matchType) {
        case 'qm':
          qualMatchList.add(curMatch);
          break;
        case 'sf':
          sfMatchList.add(curMatch);
          break;
        case 'f':
          finMatchList.add(curMatch);
          break;
      }
    }
    //sort lists of matches into number order
    qualMatchList.sort(
      (a, b) => a.matchNumber!.compareTo(b.matchNumber as num),
    );
    sfMatchList.sort(
      (a, b) => a.matchNumber!.compareTo(b.matchNumber as num),
    );
    finMatchList.sort(
      (a, b) => a.matchNumber!.compareTo(b.matchNumber as num),
    );

    combinedList = qualMatchList + sfMatchList + finMatchList;

    setState(() {
      hiveMatchList = combinedList;
    });
  }

  Future<void> readJson() async {
    settingsContent = await _localSettings;

    final response = await settingsContent.readAsString();
    final data = await jsonDecode(response);

    setState(() {
      studentName = data["local"]["studentName"];
      station = data["local"]["station"];
    });
  }

  @override
  void initState() {
    super.initState();
    getMatches(widget.eventKey);
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hivemind Events: ${widget.eventKey}'),
      ),
      body: ListView.builder(
        itemCount: hiveMatchList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MatchScoutPage(
                    station: station,
                    studentName: studentName,
                    match: hiveMatchList.elementAt(index),
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(hiveMatchList.elementAt(index).toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<io.File> _localFile(eventKey) async {
  final path = await _localPath;

  return io.File('$path/MatchSchedules/$eventKey.json');
}

Future<io.File> get _localSettings async {
  final path = await _localPath;

  return io.File('$path/settings.json');
}
