import 'package:flutter/material.dart';
import 'package:hivemind/models/tba.dart';
import 'package:hivemind/pages/auton_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hivemind TBA Events'),
      ),
      body: Column(
        children: <Widget>[
          const AutonPage(),
          ElevatedButton(
            onPressed: () {
              fetchEvents().then((beeEvents) => {
                    for (var event in beeEvents) {print(event.toString())}
                  });
            },
            child: const Text("Get Events"),
          ),
        ],
      ),
    );
  }
}
