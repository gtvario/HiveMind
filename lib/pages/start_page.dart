import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/models/globals.dart';

class StartMatchPage extends StatefulWidget {
  final ScoutData scoutData;
  final String? allianceColor;
  const StartMatchPage(
      {super.key, required this.scoutData, required this.allianceColor});

  @override
  State<StartMatchPage> createState() => _StartMatchPageState();
}

class _StartMatchPageState extends State<StartMatchPage> {
  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;
  var _tapPosition;
  String dropdownValue = "Select Student Name";

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
    String fieldImagePath = "";

    if (widget.allianceColor == 'Red') {
      fieldImagePath = 'assets/images/RedField.png';
    } else {
      fieldImagePath = 'assets/images/BlueField.png';
    }

    return Row(
      children: [
        const SizedBox(width: 35),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Container(
              decoration: BoxDecoration(border: Border.all(width: 5.0)),
              width: 600,
              height: 400,
              child: GestureDetector(
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
                child: Image.asset(
                  fieldImagePath,
                ),
              ),
            ),
          ],
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
