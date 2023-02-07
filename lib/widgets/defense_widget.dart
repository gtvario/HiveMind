import 'package:flutter/material.dart';

class Defense extends StatefulWidget {
  final List<int> teamList;
  const Defense(this.teamList, {super.key});

  @override
  State<Defense> createState() => _DefenseState();
}

class _DefenseState extends State<Defense> {
  final stopWatch1 = Stopwatch();
  final stopWatch2 = Stopwatch();
  final stopWatch3 = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
