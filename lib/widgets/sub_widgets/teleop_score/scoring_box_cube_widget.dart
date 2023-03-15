import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ScoringBoxCubeWidget extends StatefulWidget {
  final int boxIndex;
  final String gameMode;
  final ScoutData scoutData;

  const ScoringBoxCubeWidget(
      {super.key,
      required this.boxIndex,
      required this.gameMode,
      required this.scoutData});

  @override
  State<ScoringBoxCubeWidget> createState() => _ScoringBoxCubeWidgetState();
}

class _ScoringBoxCubeWidgetState extends State<ScoringBoxCubeWidget> {
  Color _color = Colors.grey;

  @override
  void initState() {
    super.initState();
    int correspondingBoxVal;

    if (widget.gameMode == 'auton') {
      correspondingBoxVal =
          widget.scoutData.getAutoGrid.elementAt(widget.boxIndex);
    } else {
      correspondingBoxVal =
          widget.scoutData.getTeleopGrid.elementAt(widget.boxIndex);
    }

    setState(() {
      if (correspondingBoxVal == 1) {
        _color = Colors.purple;
      } else if (correspondingBoxVal == 2) {
        _color = Colors.yellow;
      } else {
        _color = Colors.grey;
      }
    });
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
              if (widget.gameMode == "auton") {
                widget.scoutData.setAutoGrid = [widget.boxIndex, 0];
              } else {
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 0];
              }
            } else {
              _color = Colors.purple;
              if (widget.gameMode == "auton") {
                widget.scoutData.setAutoGrid = [widget.boxIndex, 1];
              } else {
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 1];
              }
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
