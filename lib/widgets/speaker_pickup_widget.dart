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
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        child: Image.asset('assets/images/UpArrow.png'),
        onTapUp: (details) {
          setState(() {
            _made_count++;
          });
        },
      ),
      Text(_made_count.toString(), style: TextStyle(fontSize: 35)),
      GestureDetector(
        child: Image.asset('assets/images/DownArrow.png'),
        onTapUp: (details) {
          setState(() {
            if (_made_count > 0) {
              _made_count--;
            }
          });
        },
      )
    ]);
  }
}
