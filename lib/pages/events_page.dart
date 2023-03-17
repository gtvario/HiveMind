import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:hivemind/models/match_model.dart';
import 'package:hivemind/pages/match_list_page.dart';
import 'package:hivemind/pages/match_scout_page.dart';
import 'package:path_provider/path_provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late io.File curJson;
  List<FRCMatch> hiveMatchList = [];
  List<String> events = [];

  void getEvents() async {
    var directory = (await _localPath);
    var fileList = [];
    List<String> eventNames = [];
    directory = "$directory/MatchSchedules/";
    fileList = io.Directory(directory).listSync();
    for (var file in fileList) {
      String filePath = file.path;
      eventNames.add(filePath.substring(
          filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.')));
    }

    setState(() {
      events = eventNames;
    });
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hivemind Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MatchListPage(
                    eventKey: events.elementAt(index),
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(events.elementAt(index)),
              ),
            ),
          );
        },
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
