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
  Color _color = Color.fromARGB(255, 165, 153, 167);
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
      } else if (correspondingBoxVal == 3) {
        _color = Colors.purple;
        _text = 'x2';
      } else {
        _color = const Color.fromARGB(255, 165, 153, 167);
        _text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(
            () {
              // use setState
              if (widget.gameMode == "auton") {
                if (_color == Colors.purple) {
                  _color = const Color.fromARGB(255, 165, 153, 167);
                  widget.scoutData.setAutoGrid = [widget.boxIndex, 0];
                } else {
                  _color = Colors.purple;
                  widget.scoutData.setAutoGrid = [widget.boxIndex, 1];
                }
              } else {
                if (_color == Colors.purple) {
                  if (_text == '') {
                    _text = 'x2';
                    widget.scoutData.setTeleopGrid = [widget.boxIndex, 3];
                  } else {
                    _text = '';
                    _color = const Color.fromARGB(255, 165, 153, 167);
                    widget.scoutData.setTeleopGrid = [widget.boxIndex, 0];
                  }
                } else {
                  _color = Colors.purple;
                  widget.scoutData.setTeleopGrid = [widget.boxIndex, 1];
                }
              }
            },
          );
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
