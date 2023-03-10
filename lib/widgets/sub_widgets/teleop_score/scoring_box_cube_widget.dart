import 'package:flutter/material.dart';

class ScoringBoxCubeWidget extends StatefulWidget {
  final int boxIndex;
  const ScoringBoxCubeWidget({super.key, required this.boxIndex});

  @override
  State<ScoringBoxCubeWidget> createState() => _ScoringBoxCubeWidgetState();
}

class _ScoringBoxCubeWidgetState extends State<ScoringBoxCubeWidget> {
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            // use setState
            if (_color == Colors.purple) {
              _color = Colors.grey;
            } else {
              _color = Colors.purple;
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
