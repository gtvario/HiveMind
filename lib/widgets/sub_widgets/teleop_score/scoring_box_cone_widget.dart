import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ScoringBoxConeWidget extends StatefulWidget {
  final int boxIndex;
  final String gameMode;
  final ScoutData scoutData;

  const ScoringBoxConeWidget(
      {Key? key,
      required this.boxIndex,
      required this.gameMode,
      required this.scoutData})
      : super(key: key);

  @override
  State<ScoringBoxConeWidget> createState() => _ScoringBoxConeWidgetState();
}

class _ScoringBoxConeWidgetState extends State<ScoringBoxConeWidget> {
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
            if (_color == Colors.yellow) {
              _color = Colors.grey;
              if (widget.gameMode == "auton") {
                widget.scoutData.setAutoGrid = [widget.boxIndex, 0];
              } else {
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 0];
              }
            } else {
              _color = Colors.yellow;
              if (widget.gameMode == "auton") {
                widget.scoutData.setAutoGrid = [widget.boxIndex, 2];
              } else {
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 2];
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
