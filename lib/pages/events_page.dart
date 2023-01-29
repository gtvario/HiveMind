import 'package:flutter/material.dart';
import 'package:hivemind/models/tba.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';

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
