import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Defense extends StatefulWidget {
  const Defense({super.key});

  @override
  State<Defense> createState() => _DefenseState();
}

class _DefenseState extends State<Defense> {
  String defensePlayed = 'No';
  bool defensePlayedBool = false;
  Color _starColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Defense - ",
              style: TextStyle(
                fontSize: 55,
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
              },
              child: Text(
                defensePlayed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 179, 32, 32),
                  fontSize: 55,
                  fontFamily: 'Schyler',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Transform.scale(
          scale: 1.75,
          child: RatingBar.builder(
            ignoreGestures: !defensePlayedBool,
            initialRating: 3,
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
              // Do nothing
            },
          ),
        ),
        const SizedBox(height: 45),
        const Text(
          "Driving",
          style: TextStyle(
            fontSize: 55,
            fontFamily: 'Schyler',
          ),
        ),
        const SizedBox(height: 20),
        Transform.scale(
          scale: 1.75,
          child: RatingBar.builder(
            initialRating: 3,
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
              // Do nothing
            },
          ),
        ),
      ],
    );
  }
}
