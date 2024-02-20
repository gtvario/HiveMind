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
  String defensePlayedAgainst = 'No';
  bool defensePlayedBool = false;
  bool defensePlayedAgainstBool = false;
  double defenseRating = 2, driveRating = 2, defenseAgainstRating = 2;
  Color _starColor = Colors.grey;
  Color _starColorAgainst = Colors.grey;

  @override
  void initState() {
    super.initState();
    setState(() {
      defensePlayedBool = widget.scoutData.getPlayedDefense;
      defensePlayedAgainstBool = widget.scoutData.getDefensePlayedAgainst;
      defenseRating = widget.scoutData.getDefenseScore.toDouble();
      defenseAgainstRating = widget.scoutData.getDefenseAgainstScore.toDouble();
      driveRating = widget.scoutData.getDriveScore.toDouble();

      if (defensePlayedBool) {
        defensePlayed = 'Yes';
        _starColor = Colors.amber;
      } else {
        defensePlayed = 'No';
      }

      if (defensePlayedAgainstBool) {
        defensePlayedAgainst = 'Yes';
        _starColorAgainst = Colors.amber;
      } else {
        defensePlayedAgainst = 'No';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                fontSize: 30,
                fontFamily: 'Schyler',
              ),
            ),
            Transform.scale(
              scale: 0.75,
              child: Switch(
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
            ),
            Text(
              'Yes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: defensePlayedBool ? Colors.amber : Colors.grey,
                fontSize: 30,
                fontFamily: 'Schyler',
              ),
            ),
          ],
        ),
        Transform.scale(
          scale: 0.9,
          child: RatingBar.builder(
            ignoreGestures: !defensePlayedBool,
            initialRating: defenseRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 3,
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
        const SizedBox(height: 10),
        SizedBox(
          width: 250.0,
          child: Center(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 3.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Defense Played Against?",
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
                color: defensePlayedAgainstBool ? Colors.grey : Colors.amber,
                fontSize: 30,
                fontFamily: 'Schyler',
              ),
            ),
            Transform.scale(
              scale: 0.75,
              child: Switch(
                // This bool value toggles the switch.
                value: defensePlayedAgainstBool,
                activeColor: Colors.amber,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    defensePlayedAgainstBool = value;
                    if (defensePlayedAgainstBool) {
                      _starColorAgainst = Colors.amber;
                    } else {
                      _starColorAgainst = Colors.grey;
                    }
                  });
                  widget.scoutData.setDefensePlayedAgainst =
                      defensePlayedAgainstBool;
                },
              ),
            ),
            Text(
              'Yes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: defensePlayedAgainstBool ? Colors.amber : Colors.grey,
                fontSize: 30,
                fontFamily: 'Schyler',
              ),
            ),
          ],
        ),
        Transform.scale(
          scale: 0.9,
          child: RatingBar.builder(
            ignoreGestures: !defensePlayedAgainstBool,
            initialRating: defenseAgainstRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 3,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: _starColorAgainst,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                defenseAgainstRating = rating;
              });

              widget.scoutData.setDefenseAgainstScore =
                  defenseAgainstRating.toInt();
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 250.0,
          child: Center(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 3.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Driving",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Schyler',
          ),
        ),
        const SizedBox(height: 10),
        Transform.scale(
          scale: 0.9,
          child: RatingBar.builder(
            initialRating: driveRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 3,
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
