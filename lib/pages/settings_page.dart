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
  String? studentName = "";
  String? station = "";

  late File settingsContent;
  late Map<String, dynamic> settings;

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

  Future<void> readJson() async {
    settingsContent = await _localFile;

    final response = await settingsContent.readAsString();
    final data = await jsonDecode(response);

    setState(() {
      masterToggle = data["master"]["isMaster"];
      year = data["master"]["year"];
      teamNumber = data["master"]["teamNumber"];
      studentName = data["local"]["studentName"];
      station = data["local"]["station"];
    });
  }

  void writeJson() {
    settings = {
      "master": {
        "isMaster": masterToggle,
        "teamNumber": teamNumber,
        "year": year
      },
      "local": {"studentName": studentName, "playoffs": "", "station": station}
    };
    settingsContent.writeAsString(json.encode(settings));
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
                    writeJson();
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
                      writeJson();
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
                      writeJson();
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
                value: Text(studentName.toString()),
                onPressed: (value) => {
                  _showStudentNameInputDialog(context).then((value) {
                    setState(() {
                      if (value != null) {
                        studentName = value;
                      } else {
                        studentName ??= "";
                      }
                      writeJson();
                    });
                  })
                },
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (bool value) {},
                title: const Text("Playoffs"),
              ),
              SettingsTile(
                title: const Text("Station"),
                value: Text(station.toString()),
                onPressed: (value) => {
                  _showStationInputDialog(context).then((value) {
                    setState(() {
                      if (value != null) {
                        station = value;
                      } else {
                        station ??= "";
                      }
                      writeJson();
                    });
                  }),
                },
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
final _studentNameTextController = TextEditingController();
final _stationTextController = TextEditingController();

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

Future<String?> _showStudentNameInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter Student Name"),
        content: TextField(
          controller: _studentNameTextController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () =>
                Navigator.pop(context, _studentNameTextController.text),
          ),
        ],
      );
    },
  );
}

Future<String?> _showStationInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter Station (ex. Blue 1, Red 3, etc.)"),
        content: TextField(
          controller: _stationTextController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () =>
                Navigator.pop(context, _stationTextController.text),
          ),
        ],
      );
    },
  );
}
