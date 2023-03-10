import 'package:flutter/material.dart';

class MobilityWidget extends StatefulWidget {
  const MobilityWidget({super.key});

  @override
  State<MobilityWidget> createState() => _MobilityWidgetState();
}

class _MobilityWidgetState extends State<MobilityWidget> {
  String autoMovementText = 'No';
  bool preloadCone = false;
  bool preloadCube = false;
  bool autoCollectCone = false;
  bool autoCollectCube = false;
  bool autoMovement = false;

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
                fontSize: 45,
                fontFamily: 'Schyler',
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (!autoMovement) {
                          autoMovement = true;
                          autoMovementText = 'Yes';
                        } else {
                          autoMovement = false;
                          autoMovementText = 'No';
                        }
                      });
                    },
                    child: Text(
                      autoMovementText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 179, 32, 32),
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
}
