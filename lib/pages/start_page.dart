import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/preload_widget.dart';

class StartMatchPage extends StatefulWidget {
  final ScoutData scoutData;
  const StartMatchPage({super.key, required this.scoutData});

  @override
  State<StartMatchPage> createState() => _StartMatchPageState();
}

class _StartMatchPageState extends State<StartMatchPage> {
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
    required double x_pos,
    required double y_pos,
  }) {
    // Remove the existing OverlayEntry.
    removeHighlightOverlay();

    assert(overlayEntry == null);

    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return SafeArea(
          child: Align(
            alignment: Alignment(
                ((x_pos - 10) - 470) / 470, (((y_pos + 35) - 250) / 250)),
            heightFactor: 1.0,
            child: Transform.scale(
                scale: 1.5, child: Icon(Icons.circle, color: Colors.red)),
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
    return Row(
      children: [
        SizedBox(width: 35),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    x_pos: _tapPosition.dx,
                    y_pos: _tapPosition.dy,
                  );
                },
                child: Image.asset(
                  'assets/images/BlueField.png',
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PreloadWidget(scoutData: widget.scoutData),
            ],
          ),
        )
      ],
    );
  }
}
