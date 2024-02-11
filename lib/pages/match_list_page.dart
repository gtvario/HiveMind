import 'dart:convert';
import 'dart:io';

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
  List<FRCMatch> hiveMatchListTODO = [];
  List<FRCMatch> hiveMatchListComplete = [];
  List<String> events = [];

  String? studentName = "";
  String? station = "";

  Future<void> getMatches(eventKey) async {
    List<FRCMatch> qualMatchList = [];
    List<FRCMatch> sfMatchList = [];
    List<FRCMatch> finMatchList = [];
    List<FRCMatch> combinedList = [];
    List<FRCMatch> completeList = [];
    List<FRCMatch> todoList = [];
    FRCMatch curMatch;

    hiveMatchListComplete.clear();
    hiveMatchListTODO.clear();

    var path = await _localPath;

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

    combinedList = qualMatchList;

    for (var match in combinedList) {
      String teamNum = "";
      if (station == "Blue 1" || station == "Blue 2" || station == "Blue 3") {
        teamNum = match.blueAlliance?.elementAt(int.parse(station![5]) - 1);
        teamNum = teamNum.substring(3);
      } else if (station == "Red 1" ||
          station == "Red 2" ||
          station == "Red 3") {
        teamNum = match.redAlliance?.elementAt(int.parse(station![4]) - 1);
        teamNum = teamNum.substring(3);
      }
      var matchFile =
          "$path/${match.eventKey}/${match.eventKey}_Match${match.matchNumber}_$teamNum.json";

      if (await File(matchFile).exists()) {
        completeList.add(match);
      } else {
        todoList.add(match);
      }
    }

    setState(() {
      hiveMatchListComplete = completeList;
      hiveMatchListTODO = todoList;
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

  Future<void> _refreshPage() async {
    await getMatches(widget.eventKey);
  }

  @override
  void initState() {
    super.initState();
    readJson().then(
      (value) {
        getMatches(widget.eventKey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hivemind Events: ${widget.eventKey}'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              child: Text("TODO"),
            ),
            Tab(
              child: Text("Completed"),
            ),
          ]),
        ),
        body: TabBarView(children: [
          RefreshIndicator(
            onRefresh: _refreshPage,
            child: ListView.builder(
              itemCount: hiveMatchListTODO.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: Text(
                            'Do you want to enter match ${hiveMatchListTODO.elementAt(index).matchNumber}?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MatchScoutPage(
                                    station: station,
                                    studentName: studentName,
                                    match: hiveMatchListTODO.elementAt(index),
                                  ),
                                ),
                              ).then(
                                (value) => _refreshPage(),
                              );
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child:
                          Text(hiveMatchListTODO.elementAt(index).toString()),
                    ),
                  ),
                );
              },
            ),
          ),
          RefreshIndicator(
            onRefresh: _refreshPage,
            child: ListView.builder(
              itemCount: hiveMatchListComplete.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchScoutPage(
                          station: station,
                          studentName: studentName,
                          match: hiveMatchListComplete.elementAt(index),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                          hiveMatchListComplete.elementAt(index).toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

Future<String?> get _localPath async {
  final directory = await getExternalStorageDirectory();

  return directory?.path;
}

Future<io.File> _localFile(eventKey) async {
  final path = await _localPath;

  return io.File('$path/MatchSchedules/$eventKey.json');
}

Future<io.File> get _localSettings async {
  final path = await _localPath;

  return io.File('$path/settings.json');
}
