import 'package:flutter/material.dart';
import 'package:hivemind/widgets/scoring_box_community_widget.dart';
import 'package:hivemind/widgets/scoring_box_cube_widget.dart';
import 'package:hivemind/widgets/scoring_box_cone_widget.dart';

class TeleopScoringWidget extends StatefulWidget {
  const TeleopScoringWidget({super.key});

  @override
  State<TeleopScoringWidget> createState() => _TeleopScoringWidgetState();
}

class _TeleopScoringWidgetState extends State<TeleopScoringWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCubeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
        Column(
          children: const [
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxConeWidget()),
            SizedBox(width: 85, height: 85, child: ScoringBoxCommunityWidget()),
          ],
        ),
      ],
    );
  }
}
