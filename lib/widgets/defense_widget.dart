import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Defense extends StatefulWidget {
  const Defense({super.key});

  @override
  State<Defense> createState() => _DefenseState();
}

class _DefenseState extends State<Defense> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothStarRating(
        rating: rating,
        isReadOnly: false,
        size: 60,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        starCount: 5,
        allowHalfRating: false,
        spacing: 1.0,
        color: Colors.amber,
        borderColor: Colors.amber,
        onRated: (value) {
          print("rating value -> $value");
          // print("rating value dd -> ${value.truncate()}");
        },
      ),
    );
  }
}
