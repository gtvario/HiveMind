import 'package:flutter/material.dart';
import 'package:hivemind/models/globals.dart';

class ScoringBoxCubeWidget extends StatefulWidget {
  final int boxIndex;
  final String gameMode;

  const ScoringBoxCubeWidget(
      {super.key, required this.boxIndex, required this.gameMode});

  @override
  State<ScoringBoxCubeWidget> createState() => _ScoringBoxCubeWidgetState();
}

class _ScoringBoxCubeWidgetState extends State<ScoringBoxCubeWidget> {
  Color _color = Colors.grey;

  @override
  void initState() {
    super.initState();
    String correspondingBoxVal;

    correspondingBoxVal = scoringArray[widget.boxIndex];
    if (correspondingBoxVal != "0") {
      if (correspondingBoxVal.contains("PRPL")) {
        _color = Colors.purple;
      } else {
        _color = Colors.yellow;
      }
    } else {
      _color = Colors.grey;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            // use setState
            if (_color == Colors.purple) {
              _color = Colors.grey;
              scoringArray[widget.boxIndex] = "0";
            } else {
              _color = Colors.purple;
              scoringArray[widget.boxIndex] = "${widget.gameMode}_PRPL";
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
