import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivemind/models/globals.dart';
import 'package:hivemind/pages/events_page.dart';
import 'package:hivemind/pages/settings_page.dart';
import 'package:hivemind/models/tba.dart';
import 'package:hivemind/pages/worker_to_queen_sync_page.dart';
import 'package:hivemind/widgets/queen_home_widget.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEnabled = false;
  String currMatchList = "";
  String? year = "";
  String? teamNumber = "";
  bool masterToggle = false;

  late File settingsContent;
  late Map<String, dynamic> settings;

  Future<void> readJson() async {
    settingsContent = await _localFile;

    final response = await settingsContent.readAsString();
    final data = await jsonDecode(response);

    setState(() {
      masterToggle = data["master"]["isMaster"];
      year = data["master"]["year"];
      teamNumber = data["master"]["teamNumber"];
    });
  }

  bool updateHome() {
    readJson();
    return masterToggle;
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hivemind"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: GestureDetector(
              onTap: () async {
                _passwordInputController.clear();
                var input = await _showPasswordInputDialog(context);
                int? password = int.tryParse(input ?? "");
                if (password == queenPassword) {
                  updateHome();
                  setState(() {
                    isEnabled = true;
                  });
                } else if (password != queenPassword && password != null) {
                  setState(() {
                    isEnabled = false;
                  });
                }
              },
              child: const Icon(
                Icons.lock,
                size: 26.0,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: null,
            ),
            ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text("Add/Edit Students"),
                enabled: isEnabled,
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                enabled: isEnabled,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
      body: masterToggle
          ? QueenHome(teamNumber: teamNumber, year: year)
          : workerHome(context),
    );
  }

  String _compress(String json) {
    final enCodedJson = utf8.encode(json);
    final gZipJson = gzip.encode(enCodedJson);
    final base64Json = base64.encode(gZipJson);
    return base64Json;
  }

  String _decompress(String base64Json) {
    final decodeBase64Json = base64.decode(base64Json);
    final decodegZipJson = gzip.decode(decodeBase64Json);
    final originalJson = utf8.decode(decodegZipJson);
    return originalJson;
  }

  final _passwordInputController = TextEditingController();

  Future<String?> _showPasswordInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter Passcode'),
            content: TextField(
              controller: _passwordInputController,
              decoration:
                  const InputDecoration(hintText: "Jenny I've Got Your Number"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () =>
                    Navigator.pop(context, _passwordInputController.text),
              ),
            ],
          );
        });
  }
}

Widget workerHome(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkerToQueenSyncPage(
                    deviceType: DeviceType.advertiser,
                  ),
                ),
              );
            },
            child: const Text(
              "Sync with Queen",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventsPage()),
              );
            },
            child: const Text(
              "View Events",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<String?> get _localPath async {
  final directory = await getExternalStorageDirectory();

  return directory?.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  var defaults = await rootBundle.load("assets/config/default_settings.json");
  if (!await File('$path/settings.json').exists()) {
    await File('$path/settings.json').create(recursive: true);
    File('$path/settings.json').writeAsBytes(
      defaults.buffer
          .asUint8List(defaults.offsetInBytes, defaults.lengthInBytes),
    );
  }
  return File('$path/settings.json');
}

Future<void> writeMatchJson(String? key, String json) async {
  final path = await _localPath;
  String fileName = "";

  if (key != null) {
    fileName = "$key.json";
  } else {
    fileName = "UNKNOWN.json";
  }

  File matchFile = File('$path/MatchSchedules/$fileName');
  Directory("$path/MatchSchedules").create();
  print(matchFile.path);

  if (!await matchFile.exists()) {
    print("Creating file");
    matchFile.create(recursive: true);
  }

  matchFile.writeAsString(json);
}
