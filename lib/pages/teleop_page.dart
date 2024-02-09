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
    double adjustedXPos = ((xPos - 10) - 495) / 495;
    double adjustedYPos = ((yPos + 35) - 250) / 250;
    //print("X: $xPos Y: $yPos adjX: $adjustedXPos adjY: $adjustedYPos");
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
          const SizedBox(height: 10),
          Row(
            //Scoring counters
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
                              enabled: false,
                              iconColor: MaterialStateProperty.all(Colors.red),
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
                              enabled: false,
                              iconColor: MaterialStateProperty.all(Colors.red),
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
                              enabled: false,
                              iconColor: MaterialStateProperty.all(Colors.red),
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
                              enabled: false,
                              iconColor: MaterialStateProperty.all(Colors.red),
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
                  const Text("Trap"),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: CheckboxListTile(
                            title: const Text("Left"),
                            value: leftTrap,
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
                              value: 0,
                              direction: Axis.vertical,
                              spacing: 1,
                              showButtons: true,
                              enabled: true,
                              iconColor: MaterialStateProperty.all(Colors.red),
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
          Row(
            children: [
              SizedBox(
                width: 450,
                height: 250,
                child: GestureDetector(
                  //Add onTap
                  child: Image.asset("assets/images/field24.png"),
                  onTapDown: (details) {
                    _handleTapDown(details);
                    setState(() {
                      currentPageIndex = 1;
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
          )
        ],
      ),
    );
  }
}
