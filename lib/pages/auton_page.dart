import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';
import 'package:hivemind/widgets/collected_pieces_widget.dart';
import 'package:hivemind/widgets/mobility_widget.dart';
import 'package:hivemind/widgets/charge_station_widget_auton.dart';
import 'package:hivemind/widgets/dropped_pieces_widget.dart';

class AutonPage extends StatefulWidget {
  final Function() notifyParent;
  final ScoutData scoutData;
  const AutonPage(
      {super.key, required this.scoutData, required this.notifyParent});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  late Timer timer;
  bool changeBackground = false;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      changeBackground = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 3000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: changeBackground
            ? Color.fromARGB(255, 153, 60, 60)
            : Colors.grey[50],
      ),
      child: Column(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              TeleopScoringWidget(
                mode: "auton",
                scoutData: widget.scoutData,
              ),
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
                    children: [
                      TeleopCollectWidget(
                        mode: "auton",
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
                        mode: "auton",
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
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MobilityWidget(
                            scoutData: widget.scoutData,
                          ),
                        ],
                      ),
                      const SizedBox(width: 35),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ChargeStationAuton(
                            mode: "auton",
                            scoutData: widget.scoutData,
                          ),
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
      ),
    );
  }
}
