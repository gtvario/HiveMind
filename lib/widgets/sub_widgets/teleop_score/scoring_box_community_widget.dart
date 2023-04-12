import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ScoringBoxCommunityWidget extends StatefulWidget {
  final int boxIndex;
  final String gameMode;
  final ScoutData scoutData;

  const ScoringBoxCommunityWidget(
      {super.key,
      required this.boxIndex,
      required this.gameMode,
      required this.scoutData});

  @override
  State<ScoringBoxCommunityWidget> createState() =>
      _ScoringBoxCommunityWidgetState();
}

class _ScoringBoxCommunityWidgetState extends State<ScoringBoxCommunityWidget> {
  Color _color = Colors.grey;
  String _text = '';

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
      // 0 = Empty
      // 1 = Cube
      // 2 = Cone
      // 3 = Cube x2
      // 4 = Cone x2
      // 5 = Hybrid x2
      if (correspondingBoxVal == 1) {
        _color = Colors.purple;
        _text = '';
      } else if (correspondingBoxVal == 2) {
        _color = Colors.yellow;
        _text = '';
      } else if (correspondingBoxVal == 5) {
        _color = Colors.lightBlueAccent;
        _text = 'x2';
      } else {
        _color = Colors.grey;
        _text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.gameMode == "auton") {
              _text = '';
              if (_color == Colors.yellow) {
                _color = Colors.purple;
                widget.scoutData.setAutoGrid = [widget.boxIndex, 1];
              } else if (_color == Colors.purple) {
                _color = Colors.grey;
                widget.scoutData.setAutoGrid = [widget.boxIndex, 0];
              } else {
                _color = Colors.yellow;
                widget.scoutData.setAutoGrid = [widget.boxIndex, 2];
              }
            } else {
              _text = '';
              if (_color == Colors.yellow) {
                _color = Colors.purple;
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 1];
              } else if (_color == Colors.purple) {
                _color = Colors.lightBlueAccent;
                _text = 'x2';
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 5];
              } else if (_color == Colors.lightBlueAccent) {
                _color = Colors.grey;
                widget.scoutData.setTeleopGrid = [widget.boxIndex, 0];
              } else {
                _color = Colors.yellow;
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
            child: Center(
              child: Text(_text,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
