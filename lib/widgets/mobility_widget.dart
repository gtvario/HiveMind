import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class MobilityWidget extends StatefulWidget {
  final ScoutData scoutData;

  const MobilityWidget({super.key, required this.scoutData});

  @override
  State<MobilityWidget> createState() => _MobilityWidgetState();
}

class _MobilityWidgetState extends State<MobilityWidget> {
  int autoMovement = 0;

  @override
  void initState() {
    super.initState();
    readScoutFile().then((value) {
      setState(() {
        autoMovement = widget.scoutData.getMobility;
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
                fontSize: 35,
                fontFamily: 'Schyler',
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
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
                        } else {
                          autoMovement = 0;
                        }
                        widget.scoutData.setMobility = autoMovement;
                      });
                    },
                    child: Text(
                      autoMovement == 1 ? 'Yes' : 'No',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: autoMovement == 1
                            ? Colors.green
                            : Color.fromARGB(255, 81, 5, 5),
                        fontSize: 50,
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
