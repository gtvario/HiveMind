import 'package:flutter/material.dart';

class ScoringBoxCommunityWidget extends StatefulWidget {
  final int boxIndex;
  const ScoringBoxCommunityWidget({super.key, required this.boxIndex});

  @override
  State<ScoringBoxCommunityWidget> createState() =>
      _ScoringBoxCommunityWidgetState();
}

class _ScoringBoxCommunityWidgetState extends State<ScoringBoxCommunityWidget> {
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_color == Colors.yellow) {
              _color = Colors.purple;
            } else if (_color == Colors.purple) {
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
