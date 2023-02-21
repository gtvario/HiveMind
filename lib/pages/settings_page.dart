import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:path_provider/path_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? year = "";
  String? teamNumber = "";
  bool masterToggle = false;
  late Map<String, dynamic> settings;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    if (File('$path/settings.json').exists() == false) {
      File('assets/config/default_settings.json').copy('$path/settings.json');
    }
    return File('$path/settings.json');
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/config/default_settings.json');
    final data = await jsonDecode(response);
    setState(() {
      masterToggle = data["master"]["isMaster"];
      year = data["master"]["year"];
      teamNumber = data["master"]["teamNumber"];
    });
  }

  void getPath() async {
    final path = await _localFile;
    print(path);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    getPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hivemind"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Master Configuration"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("Is Master Tablet"),
                onToggle: (bool value) {
                  setState(() {
                    masterToggle = value;
                  });
                },
                initialValue: masterToggle,
              ),
              SettingsTile(
                title: const Text("Team Number"),
                value: Text(teamNumber.toString()),
                onPressed: (value) => {
                  _showTeamNumberInputDialog(context).then((result) {
                    setState(() {
                      if (result != null) {
                        teamNumber = result;
                      } else {
                        teamNumber ??= "";
                      }
                    });
                  })
                },
              ),
              SettingsTile(
                title: const Text("Year"),
                value: Text(year.toString()),
                onPressed: (value) => {
                  _showYearInputDialog(context).then((result) {
                    setState(() {
                      if (result != null) {
                        year = result;
                      } else {
                        year ??= "";
                      }
                    });
                  })
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text("Local Configuration"),
            tiles: [
              SettingsTile(
                title: const Text("Student Name"),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (bool value) {},
                title: const Text("Playoffs"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final _yearTextController = TextEditingController();
final _teamNumberTextController = TextEditingController();

Future<String?> _showYearInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter Year"),
        content: TextField(
          controller: _yearTextController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context, _yearTextController.text),
          ),
        ],
      );
    },
  );
}

Future<String?> _showTeamNumberInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter Team Number"),
        content: TextField(
          controller: _teamNumberTextController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () =>
                Navigator.pop(context, _teamNumberTextController.text),
          ),
        ],
      );
    },
  );
}
