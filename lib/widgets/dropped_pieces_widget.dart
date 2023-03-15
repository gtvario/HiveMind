import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/dropped_cube_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/dropped_cone_widget.dart';

class DroppedPieceWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const DroppedPieceWidget(
      {super.key, required this.scoutData, required this.mode});

  @override
  State<DroppedPieceWidget> createState() => _DroppedPieceWidgetState();
}

class _DroppedPieceWidgetState extends State<DroppedPieceWidget> {
  @override
  void initState() {
    super.initState();
    widget.scoutData.readFile();
  }

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
          children: [
            SizedBox(
                width: 75,
                height: 135,
                child: DroppedConeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
            const SizedBox(width: 5),
            SizedBox(
                width: 75,
                height: 135,
                child: DroppedCubeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
          ],
        ),
      ],
    );
  }
}
