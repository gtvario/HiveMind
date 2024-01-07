import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

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
    return Container();
  }
}
