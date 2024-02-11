import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/counter_box_widget.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';

class TeleopPage extends StatefulWidget {
  final ScoutData scoutData;
  const TeleopPage({super.key, required this.scoutData});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 5),
          const Text(
            "Teleop",
            style: TextStyle(
                fontSize: 55,
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
                                      value: 0,
                                      direction: Axis.vertical,
                                      spacing: 1,
                                      showButtons: true,
                                      enabled: scoringEnable,
                                      iconColor: scoringEnable
                                          ? MaterialStateProperty.all(
                                              Colors.green)
                                          : MaterialStateProperty.all(
                                              Colors.red),
                                      onChanged: (value) {
                                        setState(() {
                                          currEvent?.setSpeakMade =
                                              value.toInt();
                                          gameEvents.add(currEvent!);
                                          currEvent = null;
                                          removeHighlightOverlay();
                                          scoringEnable = false;
                                        });
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
                                      value: 0,
                                      direction: Axis.vertical,
                                      spacing: 1,
                                      showButtons: true,
                                      enabled: scoringEnable,
                                      iconColor: scoringEnable
                                          ? MaterialStateProperty.all(
                                              Colors.green)
                                          : MaterialStateProperty.all(
                                              Colors.red),
                                      onChanged: (value) {
                                        setState(() {
                                          currEvent?.setSpeakMiss =
                                              value.toInt();
                                          gameEvents.add(currEvent!);
                                          currEvent = null;
                                          removeHighlightOverlay();
                                          scoringEnable = false;
                                        });
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
                                      value: 0,
                                      direction: Axis.vertical,
                                      spacing: 1,
                                      showButtons: true,
                                      enabled: scoringEnable,
                                      iconColor: scoringEnable
                                          ? MaterialStateProperty.all(
                                              Colors.green)
                                          : MaterialStateProperty.all(
                                              Colors.red),
                                      onChanged: (value) {
                                        setState(() {
                                          currEvent?.setAmpMade = value.toInt();
                                          gameEvents.add(currEvent!);
                                          currEvent = null;
                                          removeHighlightOverlay();
                                          scoringEnable = false;
                                        });
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
                                      value: 0,
                                      direction: Axis.vertical,
                                      spacing: 1,
                                      showButtons: true,
                                      enabled: scoringEnable,
                                      iconColor: scoringEnable
                                          ? MaterialStateProperty.all(
                                              Colors.green)
                                          : MaterialStateProperty.all(
                                              Colors.red),
                                      onChanged: (value) {
                                        setState(() {
                                          currEvent?.setAmpMiss = value.toInt();
                                          gameEvents.add(currEvent!);
                                          currEvent = null;
                                          removeHighlightOverlay();
                                          scoringEnable = false;
                                        });
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
                                    enabled: scoringEnable,
                                    onChanged: (value) {
                                      setState(() {
                                        leftTrap = !leftTrap;
                                        currEvent?.setTrapL = leftTrap;
                                        gameEvents.add(currEvent!);
                                        currEvent = null;
                                        removeHighlightOverlay();
                                        scoringEnable = false;
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: CheckboxListTile(
                                    title: const Text("Center"),
                                    value: centerTrap,
                                    enabled: scoringEnable,
                                    onChanged: (value) {
                                      setState(() {
                                        centerTrap = !centerTrap;
                                        currEvent?.setTrapC = centerTrap;
                                        gameEvents.add(currEvent!);
                                        currEvent = null;
                                        removeHighlightOverlay();
                                        scoringEnable = false;
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: CheckboxListTile(
                                    title: const Text("Right"),
                                    value: rightTrap,
                                    enabled: scoringEnable,
                                    onChanged: (value) {
                                      setState(() {
                                        rightTrap = !rightTrap;
                                        currEvent?.setTrapR = rightTrap;
                                        gameEvents.add(currEvent!);
                                        currEvent = null;
                                        removeHighlightOverlay();
                                        scoringEnable = false;
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
                                      value: 0,
                                      direction: Axis.vertical,
                                      spacing: 1,
                                      showButtons: true,
                                      enabled: scoringEnable,
                                      iconColor: scoringEnable
                                          ? MaterialStateProperty.all(
                                              Colors.green)
                                          : MaterialStateProperty.all(
                                              Colors.red),
                                      onChanged: (value) {
                                        setState(() {
                                          currEvent?.setPass = value.toInt();
                                          gameEvents.add(currEvent!);
                                          currEvent = null;
                                          scoringEnable = false;
                                          removeHighlightOverlay();
                                        });
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
                            child: Image.asset("assets/images/field24.png"),
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
      ),
    );
  }
}

class ScoreEvent {
  double xPos = 0, yPos = 0;
  int speakMade = 0, speakMiss = 0, ampMade = 0, ampMiss = 0, pass = 0;
  bool trapL = false, trapR = false, trapC = false;

  ScoreEvent(this.xPos, this.yPos);

  @override
  String toString() => "X: $xPos, Y:$yPos";

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

  set setAmpMade(int amplifyMade) {
    ampMade = amplifyMade;
  }

  set setAmpMiss(int amplifyMiss) {
    ampMiss = amplifyMiss;
  }

  set setPass(int passing) {
    pass = passing;
  }

  set setTrapL(bool trapLeft) {
    trapL = trapLeft;
  }

  set setTrapR(bool trapRight) {
    trapR = trapRight;
  }

  set setTrapC(bool trapCenter) {
    trapC = trapCenter;
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

  int get getYAmpMade {
    return ampMade;
  }

  int get getAmpMiss {
    return ampMiss;
  }

  int get getPass {
    return pass;
  }

  bool get getTrapL {
    return trapL;
  }

  bool get getTrapR {
    return trapR;
  }

  bool get getTrapC {
    return trapC;
  }
}
