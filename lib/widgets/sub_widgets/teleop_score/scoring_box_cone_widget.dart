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
  Color _color = const Color.fromARGB(255, 167, 167, 153);
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
      if (correspondingBoxVal == 2) {
        _color = Colors.yellow;
        _text = '';
      } else if (correspondingBoxVal == 4) {
        _color = Colors.yellow;
        _text = 'x2';
      } else {
        _color = const Color.fromARGB(255, 167, 167, 153);
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
            // use setState
            if (widget.gameMode == "auton") {
              _text = '';
              if (_color == Colors.yellow) {
                _color = const Color.fromARGB(255, 167, 167, 153);
                widget.scoutData.setAutoGrid = [widget.boxIndex, 0];
              } else {
                _color = Colors.yellow;
                widget.scoutData.setAutoGrid = [widget.boxIndex, 2];
              }
            } else {
              if (_color == Colors.yellow) {
                if (_text == '') {
                  _text = 'x2';
                  widget.scoutData.setTeleopGrid = [widget.boxIndex, 4];
                } else {
                  _text = '';
                  _color = const Color.fromARGB(255, 167, 167, 153);
                  widget.scoutData.setTeleopGrid = [widget.boxIndex, 0];
                }
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
