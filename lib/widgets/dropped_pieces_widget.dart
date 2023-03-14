import 'package:flutter/material.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/dropped_cube_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/dropped_cone_widget.dart';

class DroppedPieceWidget extends StatefulWidget {
  const DroppedPieceWidget({super.key});

  @override
  State<DroppedPieceWidget> createState() => _DroppedPieceWidgetState();
}

class _DroppedPieceWidgetState extends State<DroppedPieceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Dropped',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 7.5),
        Row(
          children: const [
            SizedBox(width: 75, height: 135, child: DroppedConeCollectWidget()),
            SizedBox(width: 5),
            SizedBox(width: 75, height: 135, child: DroppedCubeCollectWidget()),
          ],
        ),
      ],
    );
  }
}
