import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hivemind/models/match_model.dart';
import 'package:hivemind/pages/match_scout_page.dart';
import 'package:path_provider/path_provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late File ketJson;
  List<FRCMatch> hiveMatchList = [];

  Future<void> getMatches() async {
    List<FRCMatch> matchList = [];

    ketJson = await _localFile;
    final response = await ketJson.readAsString();
    var list = response.split('\n');
    for (var item in list) {
      if (item.endsWith(',')) {
        item = item.substring(0, item.length - 1);
      }

      matchList.add(FRCMatch.fromProcessedJson(jsonDecode(item)));
    }
    matchList.sort(
      (a, b) => a.matchNumber!.compareTo(b.matchNumber as num),
    );
    setState(() {
      hiveMatchList = matchList;
    });
  }

  @override
  void initState() {
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hivemind Events'),
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

Future<File> get _localFile async {
  final path = await _localPath;

  return File('$path/2023miket.json');
}
