import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class SpeakerPickup extends StatefulWidget {
  final ScoutData scoutData;
  const SpeakerPickup({super.key, required this.scoutData});

  @override
  State<SpeakerPickup> createState() => _SpeakerPickupState();
}

class _SpeakerPickupState extends State<SpeakerPickup> {
  int _made_count = 0;
  int _missed_count = 0;
  final Image _imagePath = Image.asset('assets/images/note.png');

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
          widget.scoutData.setSpeakerCountAuto = _made_count;
        },
      ),
      Text(_made_count.toString(), style: const TextStyle(fontSize: 35)),
      GestureDetector(
        child: Image.asset('assets/images/DownArrow.png'),
        onTapUp: (details) {
          setState(() {
            if (_made_count > 0) {
              _made_count--;
            }
          });
          widget.scoutData.setSpeakerCountAuto = _made_count;
        },
      )
    ]);
  }
}
