import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';
import 'package:hivemind/widgets/collected_pieces_widget.dart';
import 'package:hivemind/widgets/dropped_pieces_widget.dart';

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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(width: 30),
            TeleopScoringWidget(
              mode: 'teleop',
              scoutData: widget.scoutData,
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 30),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TeleopCollectWidget(
                      mode: 'teleop',
                      scoutData: widget.scoutData,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DroppedPieceWidget(
                      mode: 'teleop',
                      scoutData: widget.scoutData,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
