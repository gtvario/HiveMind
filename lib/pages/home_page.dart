import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hivemind/models/globals.dart';
import 'package:hivemind/models/match_model.dart';
import 'package:hivemind/pages/settings_page.dart';
import 'package:hivemind/models/tba.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/events_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEnabled = false;
  String currMatchList = "";
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];

  _showDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _showDeviceTolist(device);
      }
    });
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _showDeviceTolist(result.device);
      }
    });
    flutterBlue.startScan();
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
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                fetchEvents().then(
                  (List<Event> eventList) {
                    for (var element in eventList) {
                      fetchMatches(element.eventKey).then(
                        (matchList) {
                          setState(() {
                            currMatchList = _compress(matchList.join(""));
                            print(currMatchList);
                          });
                        },
                      );
                      break;
                    }
                  },
                );
              },
              child: const Text("TEST BLUE ALLIANCE"),
            ),
            QrImage(data: currMatchList, version: QrVersions.auto),
          ],
        ),
      ),
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
