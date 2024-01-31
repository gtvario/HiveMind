import 'package:flutter/material.dart';
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
    double adjustedXPos = ((xPos - 10) - 470) / 470;
    double adjustedYPos = ((yPos + 35) - 250) / 250;

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
    return Column(
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
            CounterBox(),
            CounterBox(),
            CounterBox(),
          ],
        ),
        Row(
          children: [
            Container(
              width: 800,
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
    );
  }
}
