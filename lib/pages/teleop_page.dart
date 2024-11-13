import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class TeleopPage extends StatefulWidget {
  final ScoutData scoutData;
  final String? allianceColor;
  final bool? onScoreTableSide;

  const TeleopPage(
      {super.key,
      required this.scoutData,
      this.allianceColor,
      this.onScoreTableSide});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  @override
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
