import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';

class TeleopPage extends StatefulWidget {
  final ScoutData scoutData;
  const TeleopPage({super.key, required this.scoutData});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text(
          "Teleop",
          style: TextStyle(
              fontSize: 55,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(width: 30),
            TeleopScoringWidget(
              mode: 'teleop',
              scoutData: widget.scoutData,
            ),
          ],
        ),
      ],
    );
  }
}
