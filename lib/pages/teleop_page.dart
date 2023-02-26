import 'package:flutter/material.dart';
import 'package:hivemind/widgets/teleop_scoring_widget.dart';
import 'package:hivemind/widgets/teleop_collect_widget.dart';
import 'package:hivemind/widgets/defense_widget.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const [
            TeleopScoringWidget(),
          ],
        ),
        Row(
          children: [
            TeleopCollectWidget(),
            Defense(),
          ],
        ),
      ],
    );
  }
}
