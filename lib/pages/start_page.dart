// ignore_for_file: non_constant_identifier_names

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/models/globals.dart';

class StartMatchPage extends StatefulWidget {
  final ScoutData scoutData;
  final String? allianceColor;
  final bool? onScoreTableSide;
  const StartMatchPage(
      {super.key,
      required this.scoutData,
      required this.allianceColor,
      required this.onScoreTableSide});

  @override
  State<StartMatchPage> createState() => _StartMatchPageState();
}

class _StartMatchPageState extends State<StartMatchPage> {
  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;

  double pixel_to_ft_mult_y = 0.069371;
  double pixel_to_ft_offset_y = -3.35;

  double pixel_to_ft_mult_x = 1;
  double pixel_to_ft_offset_x = 0;
  double pixel_to_ft_offset_x_red = 61.7;
  double pixel_to_ft_mult_x_red = -0.069016;
  double pixel_to_ft_offset_x_blue = -36.3;
  double pixel_to_ft_mult_x_blue = 0.069016;

  var _tapPosition;
  String dropdownValue = "Select Student Name";
  List<double> robotStartingPos = [0, 0];

  void _handleTapDown(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void createHighlightOverlay({
    required double xPos,
    required double yPos,
  }) {
    // Remove the existing OverlayEntry.
    double adjustedXPos = ((xPos - 10) - 468) / 468;
    double adjustedYPos = ((yPos + 35) - 245) / 245;

    String robot_image = '';

    if (widget.allianceColor == 'Red') {
      robot_image = 'assets/images/red_robot.png';
    } else {
      robot_image = 'assets/images/blue_robot.png';
    }

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
            child: Image.asset(robot_image),
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
    setState(() {
      dropdownValue = widget.scoutData.getStudentName;
    });
  }

  @override
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    removeHighlightOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      robotStartingPos = widget.scoutData.getStartingPos;
      if (robotStartingPos[0] > 0 && robotStartingPos[1] > 0) {
        createHighlightOverlay(
          xPos: robotStartingPos[0],
          yPos: robotStartingPos[1],
        );
      }
    });
    String fieldImagePath = "";
    Alignment fieldAlignment;

    if (widget.allianceColor == 'Red') {
      fieldImagePath = 'assets/images/RedField.png';
      fieldAlignment = Alignment.centerRight;
      pixel_to_ft_offset_x = pixel_to_ft_offset_x_red;
      pixel_to_ft_mult_x = pixel_to_ft_mult_x_red;
    } else {
      fieldImagePath = 'assets/images/BlueField.png';
      fieldAlignment = Alignment.centerLeft;
      pixel_to_ft_offset_x = pixel_to_ft_offset_x_blue;
      pixel_to_ft_mult_x = pixel_to_ft_mult_x_blue;
    }

    double imageFlipRad = 0;

    if (widget.onScoreTableSide == true) {
      imageFlipRad = math.pi;
    }

    return Row(
      children: [
        const SizedBox(width: 35),
        Column(
          children: [
            const SizedBox(height: 22),
            DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 0, 0)),
              items: studentList.map(
                (item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                  widget.scoutData.setStudentName = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(width: 35),
        Container(
          width: 200, // Set the width to limit the Column's width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Click on the field to mark the robot's starting position",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      softWrap: true,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.trending_flat,
                size: 90.0,
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          alignment: fieldAlignment,
          decoration: BoxDecoration(border: Border.all(width: 5.0)),
          width: 400,
          height: 400,
          child: GestureDetector(
            onTapDown: (details) {
              _handleTapDown(details);
              setState(() {
                widget.scoutData.setStartingPos = [
                  _tapPosition.dx,
                  _tapPosition.dy,
                ];

                var pos_y =
                    _tapPosition.dy * pixel_to_ft_mult_y + pixel_to_ft_offset_y;

                if (widget.onScoreTableSide == true) {
                  pos_y = (pos_y * -1) + 26;
                }

                widget.scoutData.setStartingPosNormalized = [
                  _tapPosition.dx * pixel_to_ft_mult_x + pixel_to_ft_offset_x,
                  pos_y,
                ];

                print(
                    "X Position:  ${_tapPosition.dx * pixel_to_ft_mult_x + pixel_to_ft_offset_x}");
                print("Y Position: $pos_y");
                currentPageIndex = 1;
              });
              createHighlightOverlay(
                xPos: _tapPosition.dx,
                yPos: _tapPosition.dy,
              );
            },
            child: // Image flipped vertically
                Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(imageFlipRad),
              child: Image.asset(fieldImagePath),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        )
      ],
    );
  }
}
