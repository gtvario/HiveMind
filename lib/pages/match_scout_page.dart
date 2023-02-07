import 'package:flutter/material.dart';
import 'package:hivemind/pages/auton_page.dart';

class MatchScoutPage extends StatefulWidget {
  const MatchScoutPage({super.key});

  @override
  State<MatchScoutPage> createState() => _MatchScoutPageState();
}

class _MatchScoutPageState extends State<MatchScoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hivemind TBA Events'),
      ),
      body: PageView(
        children: const [
          Center(
            child: AutonPage(),
          ),
          Center(
            child: Text("TEST2"),
          )
        ],
      ),
    );
  }
}
