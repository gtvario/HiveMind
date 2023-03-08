import 'package:flutter/material.dart';
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
            onPressed: () {},
            child: const Text("Get Events"),
          ),
        ],
      ),
    );
  }
}
