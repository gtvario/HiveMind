import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hivemind/models/scout_data_model.dart';

class Defense extends StatefulWidget {
  final ScoutData scoutData;
  const Defense({super.key, required this.scoutData});

  @override
  State<Defense> createState() => _DefenseState();
}

class _DefenseState extends State<Defense> {
  String defensePlayed = 'No';
  bool defensePlayedBool = false;
  double defenseRating = 3, driveRating = 3;
  Color _starColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    setState(() {
      defensePlayedBool = widget.scoutData.getPlayedDefense;
      defenseRating = widget.scoutData.getDefenseScore.toDouble();
      driveRating = widget.scoutData.getDriveScore.toDouble();

      if (defensePlayedBool) {
        defensePlayed = 'Yes';
        _starColor = Colors.amber;
      } else {
        defensePlayed = 'No';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Defense Played?",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Schyler',
          ),
        ),
        Row(
          children: [
            Text(
              'No',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: defensePlayedBool ? Colors.grey : Colors.amber,
                fontSize: 35,
                fontFamily: 'Schyler',
              ),
            ),
            Switch(
              // This bool value toggles the switch.
              value: defensePlayedBool,
              activeColor: Colors.amber,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  defensePlayedBool = value;
                  if (defensePlayedBool) {
                    _starColor = Colors.amber;
                  } else {
                    _starColor = Colors.grey;
                  }
                });
                widget.scoutData.setPlayedDefense = defensePlayedBool;
              },
            ),
            Text(
              'Yes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: defensePlayedBool ? Colors.amber : Colors.grey,
                fontSize: 35,
                fontFamily: 'Schyler',
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Transform.scale(
          scale: 1.2,
          child: RatingBar.builder(
            ignoreGestures: !defensePlayedBool,
            initialRating: defenseRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: _starColor,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                defenseRating = rating;
              });

              widget.scoutData.setDefenseScore = defenseRating.toInt();
            },
          ),
        ),
        const SizedBox(height: 45),
        const Text(
          "Driving",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Schyler',
          ),
        ),
        const SizedBox(height: 20),
        Transform.scale(
          scale: 1.2,
          child: RatingBar.builder(
            initialRating: driveRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                driveRating = rating;
              });

              widget.scoutData.setDriveScore = driveRating.toInt();
            },
          ),
        ),
      ],
    );
  }
}
