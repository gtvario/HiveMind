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
      } else {
        defensePlayed = 'No';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Defense - ",
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Schyler',
              ),
            ),
            InkWell(
              onTapDown: (details) {
                setState(() {
                  if (!defensePlayedBool) {
                    defensePlayedBool = true;
                    defensePlayed = 'Yes';
                    _starColor = Colors.amber;
                  } else {
                    defensePlayedBool = false;
                    defensePlayed = 'No';
                    _starColor = Colors.grey;
                  }
                });

                widget.scoutData.setPlayedDefense = defensePlayedBool;
              },
              child: Text(
                defensePlayed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 179, 32, 32),
                  fontSize: 35,
                  fontFamily: 'Schyler',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
