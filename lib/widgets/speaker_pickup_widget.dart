import 'package:flutter/material.dart';
import 'package:hivemind/models/globals.dart';
import 'package:hivemind/models/scout_data_model.dart';

class SpeakerPickup extends StatefulWidget {
  final ScoutData scoutData;
  final ScoringStation scoringStation;
  const SpeakerPickup(
      {super.key, required this.scoutData, required this.scoringStation});

  @override
  State<SpeakerPickup> createState() => _SpeakerPickupState();
}

class _SpeakerPickupState extends State<SpeakerPickup> {
  int _count = 0;
  final Image _imagePath = Image.asset('assets/images/note.png');

  @override
  void initState() {
    super.initState();
    if (widget.scoringStation == ScoringStation.ampMade) {
      _count = widget.scoutData.getAmpCountAuto;
    } else if (widget.scoringStation == ScoringStation.ampMissed) {
      _count = widget.scoutData.getMissedAmpCountAuto;
    } else if (widget.scoringStation == ScoringStation.speakerMade) {
      _count = widget.scoutData.getSpeakerCountAuto;
    } else if (widget.scoringStation == ScoringStation.speakerMissed) {
      _count = widget.scoutData.getMissedSpeakerCountAuto;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        child: Image.asset('assets/images/UpArrow.png'),
        onTapUp: (details) {
          setState(() {
            _count++;
          });
          if (widget.scoringStation == ScoringStation.ampMade) {
            widget.scoutData.setAmpCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.ampMissed) {
            widget.scoutData.setMissedAmpCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.speakerMade) {
            widget.scoutData.setSpeakerCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.speakerMissed) {
            widget.scoutData.setMissedSpeakerCountAuto = _count;
          }
        },
      ),
      Text(_count.toString(), style: const TextStyle(fontSize: 35)),
      GestureDetector(
        child: Image.asset('assets/images/DownArrow.png'),
        onTapUp: (details) {
          setState(() {
            if (_count > 0) {
              _count--;
            }
          });
          if (widget.scoringStation == ScoringStation.ampMade) {
            widget.scoutData.setAmpCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.ampMissed) {
            widget.scoutData.setMissedAmpCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.speakerMade) {
            widget.scoutData.setSpeakerCountAuto = _count;
          } else if (widget.scoringStation == ScoringStation.speakerMissed) {
            widget.scoutData.setMissedSpeakerCountAuto = _count;
          }
        },
      )
    ]);
  }
}
