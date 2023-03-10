import 'package:flutter/material.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';
import 'package:hivemind/widgets/teleop_collect_widget.dart';
import 'package:hivemind/widgets/preload_widget.dart';
import 'package:hivemind/widgets/mobility_widget.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';

class AutonPage2 extends StatefulWidget {
  const AutonPage2({super.key});

  @override
  State<AutonPage2> createState() => _AutonPage2State();
}

class _AutonPage2State extends State<AutonPage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text(
          "Autonomous",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 65,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            SizedBox(width: 30),
            TeleopScoringWidget(mode: "auton"),
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
              const SizedBox(width: 5),
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
                        SizedBox(height: 30),
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
