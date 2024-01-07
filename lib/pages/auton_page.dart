import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class AutonPage extends StatefulWidget {
  final Function() notifyParent;
  final ScoutData scoutData;
  const AutonPage(
      {super.key, required this.scoutData, required this.notifyParent});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  late Timer timer;
  bool changeBackground = false;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
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
    return AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: changeBackground
              ? Color.fromARGB(255, 153, 60, 60)
              : Colors.grey[50],
        ),
        child: Container());
  }
}
