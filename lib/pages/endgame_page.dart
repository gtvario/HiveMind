import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class EndgamePage extends StatefulWidget {
  final ScoutData scoutData;
  const EndgamePage({super.key, required this.scoutData});

  @override
  State<EndgamePage> createState() => _EndgamePageState();
}

class _EndgamePageState extends State<EndgamePage> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
