import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/defense_widget.dart';
import 'package:hivemind/widgets/robot_condition_widget.dart';

class EndgamePage extends StatefulWidget {
  const EndgamePage({super.key});

  @override
  State<EndgamePage> createState() => _EndgamePageState();
}

class _EndgamePageState extends State<EndgamePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        const Text(
          "End Game",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 55,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 50),
            Column(
              children: const [
                ChargeStation(),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              children: const [
                RobotCondition(),
              ],
            ),
            const SizedBox(width: 85),
            Column(
              children: const [
                Defense(),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 25),
            SizedBox(
              width: 900,
              child: TextField(
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comments',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
