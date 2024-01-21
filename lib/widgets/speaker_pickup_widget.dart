import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SpeakerPickup extends StatefulWidget {
  const SpeakerPickup({super.key});

  @override
  State<SpeakerPickup> createState() => _SpeakerPickupState();
}

class _SpeakerPickupState extends State<SpeakerPickup> {
  late Offset _startPos;
  late Offset _endPos;
  int _made_count = 0;
  int _missed_count = 0;
  Image _imagePath = Image.asset('assets/images/note.png');

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          child: Text(_made_count.toString(), style: TextStyle(fontSize: 35)),
          onVerticalDragStart: (details) {
            _startPos = details.localPosition;
          },
          onVerticalDragUpdate: (details) {
            _endPos = details.localPosition;
          },
          onVerticalDragEnd: (details) {
            if (_startPos.dy - _endPos.dy > 10) {
              setState(() {
                _made_count++;
              });
            } else if (_startPos.dy - _endPos.dy < 10 && _made_count > 0) {
              setState(() {
                _made_count--;
              });
            }
          })
    ]);
  }
}
