import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class TeleopScoringWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const TeleopScoringWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<TeleopScoringWidget> createState() => _TeleopScoringWidgetState();
}

class _TeleopScoringWidgetState extends State<TeleopScoringWidget> {
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
