import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';
import 'package:hivemind/widgets/collected_pieces_widget.dart';
import 'package:hivemind/widgets/preload_widget.dart';
import 'package:hivemind/widgets/mobility_widget.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/dropped_pieces_widget.dart';

class AutonPage extends StatefulWidget {
  final ScoutData scoutData;
  const AutonPage({super.key, required this.scoutData});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text(
          "Autonomous",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 55,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            SizedBox(width: 30),
            TeleopScoringWidget(mode: "auto"),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 15),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    TeleopCollectWidget(),
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
                  children: const [
                    DroppedPieceWidget(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        PreloadWidget(),
                        SizedBox(height: 15),
                        MobilityWidget(),
                      ],
                    ),
                    const SizedBox(width: 75),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        ChargeStation(),
                      ],
                    ),
                    const SizedBox(width: 15),
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
