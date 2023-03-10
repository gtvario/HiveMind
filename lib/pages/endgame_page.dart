import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/defense_widget.dart';

class EndgamePage extends StatefulWidget {
  const EndgamePage({super.key});

  @override
  State<EndgamePage> createState() => _EndgamePageState();
}

class _EndgamePageState extends State<EndgamePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text(
          "End Game",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 65,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 50),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 50),
            Column(
              children: const [
                ChargeStation(),
              ],
            ),
            const SizedBox(width: 150),
            Column(
              children: const [
                Defense(),
              ],
            ),
            const SizedBox(width: 150),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 400,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 15,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Comments',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
