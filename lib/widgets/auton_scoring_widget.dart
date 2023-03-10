import 'package:flutter/material.dart';
import 'package:hivemind/widgets/counter_box_widget.dart';

class Scoring extends StatefulWidget {
  const Scoring({super.key});

  @override
  State<Scoring> createState() => _ScoringState();
}

class _ScoringState extends State<Scoring> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Score",
          style: TextStyle(
            fontSize: 65,
            fontFamily: 'Schyler',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/cone_new.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 60),
            Image.asset(
              'assets/images/cube_new.png',
              width: 75,
              height: 75,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'High',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Schyler',
              ),
            ),
            SizedBox(width: 20),
            CounterBox(),
            SizedBox(width: 20),
            CounterBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Mid',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Schyler',
              ),
            ),
            SizedBox(width: 20),
            CounterBox(),
            SizedBox(width: 20),
            CounterBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Low',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Schyler',
              ),
            ),
            SizedBox(width: 20),
            CounterBox(),
            SizedBox(width: 20),
            CounterBox(),
          ],
        ),
      ],
    );
  }
}