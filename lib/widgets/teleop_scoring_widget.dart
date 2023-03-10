import 'package:flutter/material.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_community_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_cube_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_cone_widget.dart';

class TeleopScoringWidget extends StatefulWidget {
  final String mode;
  const TeleopScoringWidget({super.key, required this.mode});

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
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 0)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 1)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 2)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 3)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 4)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 5)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 6)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 7)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 8)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 9)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 10)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 11)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 12)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 13)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 14)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 15)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 16)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 17)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 18)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 19)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 20)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 21)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCubeWidget(boxIndex: 22)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 23)),
          ],
        ),
        Column(
          children: const [
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 24)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxConeWidget(boxIndex: 25)),
            SizedBox(
                width: 90,
                height: 90,
                child: ScoringBoxCommunityWidget(boxIndex: 26)),
          ],
        ),
      ],
    );
  }
}
