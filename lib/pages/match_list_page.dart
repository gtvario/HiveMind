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
  late io.File curJson;
  List<FRCMatch> hiveMatchList = [];
  List<String> events = [];

  Future<void> getMatches(eventKey) async {
    List<FRCMatch> qualMatchList = [];
    List<FRCMatch> sfMatchList = [];
    List<FRCMatch> finMatchList = [];
    List<FRCMatch> combinedList = [];
    FRCMatch curMatch;

    curJson = await _localFile(eventKey);
    final response = await curJson.readAsString();
    var list = response.split('\n');
    for (var item in list) {
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

  @override
  void initState() {
    super.initState();
    getMatches(widget.eventKey);
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
                  builder: (context) => const MatchScoutPage(),
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
