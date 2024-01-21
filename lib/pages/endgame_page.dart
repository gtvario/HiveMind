import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/defense_widget.dart';
import 'package:hivemind/widgets/robot_condition_widget.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';

class EndgamePage extends StatefulWidget {
  final ScoutData scoutData;
  const EndgamePage({super.key, required this.scoutData});

  @override
  State<EndgamePage> createState() => _EndgamePageState();
}

class _EndgamePageState extends State<EndgamePage> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      commentController.text = widget.scoutData.getComments;
    });
  }

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
              children: [
                ChargeStation(
                  mode: 'endgame',
                  scoutData: widget.scoutData,
                ),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              children: [
                RobotCondition(
                  scoutData: widget.scoutData,
                ),
              ],
            ),
            const SizedBox(width: 85),
            Column(
              children: [
                Defense(
                  scoutData: widget.scoutData,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 25),
            SizedBox(
              width: 500,
              child: TextField(
                onChanged: (value) {
                  widget.scoutData.setComments = value;
                },
                controller: commentController,
                style: const TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comments',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
