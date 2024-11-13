import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class AutonPage extends StatefulWidget {
  final Function() notifyParent;
  final ScoutData scoutData;
  final String? allianceColor;
  final bool? onScoreTableSide;
  const AutonPage(
      {super.key,
      required this.scoutData,
      required this.allianceColor,
      required this.onScoreTableSide,
      required this.notifyParent});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  late Timer timer;
  bool changeBackground = false;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      changeBackground = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
