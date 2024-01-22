import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/models/globals.dart';
import 'package:hivemind/widgets/leave_zone_widget.dart';
import 'package:hivemind/widgets/note_widget.dart';
import 'package:hivemind/widgets/speaker_pickup_widget.dart';

class AutonPage extends StatefulWidget {
  final Function() notifyParent;
  final ScoutData scoutData;
  final String? allianceColor;
  const AutonPage(
      {super.key,
      required this.scoutData,
      required this.allianceColor,
      required this.notifyParent});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  OverlayEntry? overlayEntry;
  late Timer timer;
  int currentPageIndex = 0;
  var _tapPosition;
  bool changeBackground = false;

  void _handleTapDown(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void createHighlightOverlay({
    required AlignmentDirectional alignment,
    required Color borderColor,
    required double xPos,
    required double yPos,
  }) {
    // Remove the existing OverlayEntry.
    double adjustedXPos = ((xPos - 10) - 470) / 470;
    double adjustedYPos = ((yPos + 35) - 250) / 250;
    double fieldAdjustedX = 0;
    double fieldAdjustedY = 0;

    if (widget.allianceColor == 'Red') {
      fieldAdjustedX = (xPos * -1) + 628;
      fieldAdjustedY = (yPos) - 172;
    } else {
      fieldAdjustedX = xPos - 40;
      fieldAdjustedY = (yPos) - 172;
    }

    if (fieldAdjustedX < 130) {}

    removeHighlightOverlay();

    assert(overlayEntry == null);

    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return SafeArea(
          child: Align(
            alignment: Alignment(adjustedXPos, adjustedYPos),
            heightFactor: 1.0,
            child: Transform.scale(
                scale: 1.5, child: const Icon(Icons.circle, color: Colors.red)),
          ),
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  // Remove the OverlayEntry.
  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

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
    String fieldImagePath = "";

    if (widget.allianceColor == 'Red') {
      fieldImagePath = 'assets/images/RedField.png';
    } else {
      fieldImagePath = 'assets/images/BlueField_Auton.png';
    }

    return AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: changeBackground
              ? const Color.fromARGB(255, 153, 60, 60)
              : Colors.grey[50],
        ),
        child: Row(
          children: [
            Expanded(
                flex: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      "Autonomous",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: 40,
                          decoration: TextDecoration.underline),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(border: Border.all(width: 5.0)),
                      width: 600,
                      height: 400,
                      child: Stack(
                        children: [
                          Image.asset(
                            fieldImagePath,
                          ),
                          const Positioned(
                            top: 44,
                            left: 128,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                            top: 113,
                            left: 128,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                              top: 182,
                              left: 128,
                              height: 25,
                              width: 25,
                              child: Note()),
                          const Positioned(
                            top: 22,
                            left: 392,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                            top: 102,
                            left: 392,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                            top: 182,
                            left: 392,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                            top: 262,
                            left: 392,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                          const Positioned(
                            top: 342,
                            left: 392,
                            height: 25,
                            width: 25,
                            child: Note(),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 25,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Left Starting Zone?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "No",
                        style: TextStyle(fontSize: 24),
                      ),
                      LeaveZone(),
                      Text(
                        "Yes",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Text('Speaker',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          const SizedBox(height: 7),
                          Row(children: [
                            Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text('Made',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 75,
                                    child: SpeakerPickup(),
                                  )
                                ])),
                            Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text('Missed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 75,
                                    child: SpeakerPickup(),
                                  )
                                ])),
                          ])
                        ]))
                  ]),
                  SizedBox(height: 30),
                  Row(children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Text('Amp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          const SizedBox(height: 7),
                          Row(children: [
                            Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text('Made',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 75,
                                    child: SpeakerPickup(),
                                  )
                                ])),
                            Expanded(
                                flex: 1,
                                child: Column(children: const [
                                  Text('Missed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 75,
                                    child: SpeakerPickup(),
                                  )
                                ])),
                          ])
                        ]))
                  ])
                ],
              ),
            )
          ],
        ));
  }
}
