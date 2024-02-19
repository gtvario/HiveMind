import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/counter_box_widget.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';

class TeleopPage extends StatefulWidget {
  final ScoutData scoutData;
  final String? allianceColor;
  const TeleopPage({super.key, required this.scoutData, this.allianceColor});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;
  int passed = 0, speakerMade = 0, speakerMiss = 0, ampMade = 0, ampMiss = 0;
  bool leftTrap = false, centerTrap = false, rightTrap = false;
  bool scoringEnable = false;
  double currTapX = -1, currTapY = -1;

  ScoreEvent? currEvent;

  List<ScoreEvent> gameEvents = [];
  var _tapPosition;
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
    double adjustedXPos = ((xPos - 10) - 450) / 450;
    double adjustedYPos = ((yPos + 35) - 250) / 250;

    currTapX = adjustedXPos;
    currTapY = adjustedYPos;

    currEvent ??= ScoreEvent(currTapX, currTapY);

    currEvent?.setXPos = currTapX;
    currEvent?.setYPos = currTapY;

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
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    removeHighlightOverlay();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    passed = widget.scoutData.getNotesPassed;
    speakerMade = widget.scoutData.getTeleopSpeakerMade;
    speakerMiss = widget.scoutData.getTeleopSpeakerMissed;
    ampMade = widget.scoutData.getTeleopAmpMade;
    ampMiss = widget.scoutData.getTeleopAmpMissed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Teleop",
          style: TextStyle(
              fontSize: 40,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        Row(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Amp"),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text("Made"),
                                SizedBox(
                                  width: 50,
                                  height: 200,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: ampMade.toDouble(),
                                    direction: Axis.vertical,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: true,
                                    iconColor:
                                        MaterialStateProperty.all(Colors.green),
                                    onChanged: (value) {
                                      setState(() {
                                        ampMade = value.toInt();
                                      });
                                      widget.scoutData.setTeleopAmpMade =
                                          ampMade;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Miss"),
                                SizedBox(
                                  width: 50,
                                  height: 200,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: ampMiss.toDouble(),
                                    direction: Axis.vertical,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: true,
                                    iconColor:
                                        MaterialStateProperty.all(Colors.green),
                                    onChanged: (value) {
                                      setState(() {
                                        ampMiss = value.toInt();
                                      });
                                      widget.scoutData.setTeleopAmpMissed =
                                          ampMiss;
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Column(
                      children: [
                        const Text("Speaker"),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text("Made"),
                                SizedBox(
                                  width: 50,
                                  height: 200,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: speakerMade.toDouble(),
                                    direction: Axis.vertical,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: scoringEnable,
                                    iconColor: scoringEnable
                                        ? MaterialStateProperty.all(
                                            Colors.green)
                                        : MaterialStateProperty.all(Colors.red),
                                    onChanged: (value) {
                                      setState(() {
                                        currEvent?.setSpeakMade = value.toInt();
                                        gameEvents.add(currEvent!);
                                        currEvent = null;
                                        removeHighlightOverlay();
                                        scoringEnable = false;
                                        speakerMade = value.toInt();
                                      });
                                      widget.scoutData.setTeleopSpeakerMade =
                                          speakerMade;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Miss"),
                                SizedBox(
                                  width: 50,
                                  height: 200,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: speakerMiss.toDouble(),
                                    direction: Axis.vertical,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: scoringEnable,
                                    iconColor: scoringEnable
                                        ? MaterialStateProperty.all(
                                            Colors.green)
                                        : MaterialStateProperty.all(Colors.red),
                                    onChanged: (value) {
                                      setState(() {
                                        currEvent?.setSpeakMiss = value.toInt();
                                        gameEvents.add(currEvent!);
                                        currEvent = null;
                                        removeHighlightOverlay();
                                        scoringEnable = false;
                                        speakerMiss = value.toInt();
                                      });
                                      widget.scoutData.setTeleopSpeakerMissed =
                                          speakerMiss;
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Trap"),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: CheckboxListTile(
                                  title: const Text("Left"),
                                  value: leftTrap,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {
                                      leftTrap = !leftTrap;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: CheckboxListTile(
                                  title: const Text("Center"),
                                  value: centerTrap,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {
                                      centerTrap = !centerTrap;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: CheckboxListTile(
                                  title: const Text("Right"),
                                  value: rightTrap,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {
                                      rightTrap = !rightTrap;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text("Passed"),
                                SizedBox(
                                  width: 50,
                                  height: 200,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: passed.toDouble(),
                                    direction: Axis.vertical,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: true,
                                    iconColor:
                                        MaterialStateProperty.all(Colors.green),
                                    onChanged: (value) {
                                      setState(() {
                                        passed = value.toInt();
                                      });
                                      widget.scoutData.setNotesPassed = passed;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 550,
                        height: 250,
                        child: GestureDetector(
                          //Add onTap
                          child: widget.allianceColor == "Red"
                              ? Image.asset("assets/images/RedField.png")
                              : Image.asset("assets/images/BlueField.png"),
                          onTapDown: (details) {
                            _handleTapDown(details);
                            setState(() {
                              currentPageIndex = 1;
                              scoringEnable = true;
                            });
                            createHighlightOverlay(
                              alignment: AlignmentDirectional.bottomStart,
                              borderColor: Colors.red,
                              xPos: _tapPosition.dx,
                              yPos: _tapPosition.dy,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: gameEvents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  gameEvents.removeAt(index);
                                });
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(gameEvents[index].toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ScoreEvent {
  double xPos = 0, yPos = 0;
  int speakMade = 0, speakMiss = 0;

  ScoreEvent(this.xPos, this.yPos);

  @override
  String toString() {
    String output = "X: $xPos, Y:$yPos";

    if (speakMade != 0) {
      output = "Speaker Made at $output";
    } else {
      output = "Speaker Miss at $output";
    }

    return output;
  }

  set setXPos(double xPosition) {
    xPos = xPosition;
  }

  set setYPos(double yPosition) {
    yPos = yPosition;
  }

  set setSpeakMade(int speakerMade) {
    speakMade = speakerMade;
  }

  set setSpeakMiss(int speakerMiss) {
    speakMiss = speakerMiss;
  }

  // Getters
  double get getXPos {
    return xPos;
  }

  double get getYPos {
    return yPos;
  }

  int get getSpeakMade {
    return speakMade;
  }

  int get getSpeakMiss {
    return speakMiss;
  }
}
