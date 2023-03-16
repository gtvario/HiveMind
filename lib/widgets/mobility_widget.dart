import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class MobilityWidget extends StatefulWidget {
  final ScoutData scoutData;

  const MobilityWidget({super.key, required this.scoutData});

  @override
  State<MobilityWidget> createState() => _MobilityWidgetState();
}

class _MobilityWidgetState extends State<MobilityWidget> {
  String autoMovementText = 'No';
  int autoMovement = 0;

  @override
  void initState() {
    super.initState();
    readScoutFile().then((value) {
      setState(() {
        autoMovement = widget.scoutData.getMobility;
        if (autoMovement == 0) {
          autoMovementText = 'No';
        } else {
          autoMovementText = 'Yes';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text(
              "Autonomous\nMobility?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 40,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (autoMovement == 0) {
                          autoMovement = 1;
                          autoMovementText = 'Yes';
                        } else {
                          autoMovement = 0;
                          autoMovementText = 'No';
                        }
                        widget.scoutData.setMobility = autoMovement;
                      });
                    },
                    child: Text(
                      autoMovementText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 179, 32, 32),
                        fontSize: 35,
                        fontFamily: 'Schyler',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> readScoutFile() async {
    await widget.scoutData.readFile();
  }
}
