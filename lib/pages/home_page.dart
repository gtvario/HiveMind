import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hivemind/models/globals.dart';
import 'package:hivemind/pages/settings_page.dart';
import 'package:hivemind/models/tba.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sqflite/sqflite.dart';
import '../models/events_model.dart';

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

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    if (!await File('$path/settings.json').exists()) {
      File('assets/config/default_settings.json').copy('$path/settings.json');
    }
    return File('$path/settings.json');
  }

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
      body: updateHome() ? queenHome() : workerHome(),
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

Widget queenHome() {
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
            onPressed: () {},
            child: const Text(
              "Get Matches",
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
            onPressed: () {},
            child: const Text(
              "Sync With Workers",
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
            onPressed: () {},
            child: const Text(
              "Sync with Sheet",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget workerHome() {
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
            onPressed: () {},
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
            onPressed: () {},
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
