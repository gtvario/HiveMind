import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hivemind/models/tba.dart';
import 'package:hivemind/pages/home_page.dart';
import 'package:hivemind/pages/queen_worker_sync_page.dart';

class QueenHome extends StatefulWidget {
  final dynamic teamNumber;
  final dynamic year;
  const QueenHome({super.key, this.teamNumber, this.year});

  @override
  State<QueenHome> createState() => _QueenHomeState();
}

class _QueenHomeState extends State<QueenHome> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
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
            child: ElevatedButton.icon(
              icon: isLoading
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Icon(Icons.feedback),
              onPressed: () {
                var json = "";
                setState(() {
                  isLoading = true;
                });
                fetchEvents('frc${widget.teamNumber}', widget.year)
                    .then((value) async {
                  for (var event in value) {
                    await fetchMatches(event.eventKey).then((value) {
                      for (var match in value) {
                        json = "$json${jsonEncode(match.toJson())},\n";
                      }
                      if (json.isNotEmpty) {
                        json = json.substring(0, json.length - 2);
                        writeMatchJson(event.eventKey, json);
                      }
                    });
                  }
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              label: const Text(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QueenWorkerSyncPage(
                            deviceType: DeviceType.browser,
                          )),
                );
              },
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
}
