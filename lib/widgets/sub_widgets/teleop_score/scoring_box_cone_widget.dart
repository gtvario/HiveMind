import 'package:flutter/material.dart';

class ScoringBoxConeWidget extends StatefulWidget {
  const ScoringBoxConeWidget({super.key});

  @override
  State<ScoringBoxConeWidget> createState() => _ScoringBoxConeWidgetState();
}

class _ScoringBoxConeWidgetState extends State<ScoringBoxConeWidget> {
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            // use setState
            if (_color == Colors.yellow) {
              _color = Colors.grey;
            } else {
              _color = Colors.yellow;
            }
          });
        },
        child: SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), color: _color),
          ),
        ),
      ),
    );
  }
}
