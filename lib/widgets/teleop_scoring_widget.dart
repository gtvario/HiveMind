import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_community_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_cube_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/scoring_box_cone_widget.dart';

class TeleopScoringWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const TeleopScoringWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<TeleopScoringWidget> createState() => _TeleopScoringWidgetState();
}

class _TeleopScoringWidgetState extends State<TeleopScoringWidget> {
  @override
  void initState() {
    super.initState();
    widget.scoutData.readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 0,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 1,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 2,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 3,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 4,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 5,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 6,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 7,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 8,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 9,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 10,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 11,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 12,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 13,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 14,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 15,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 16,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 17,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 18,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 19,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 20,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 21,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCubeWidget(
                    boxIndex: 22,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                  boxIndex: 23,
                  gameMode: widget.mode,
                  scoutData: widget.scoutData,
                )),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 24,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxConeWidget(
                    boxIndex: 25,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
            SizedBox(
                width: 55,
                height: 55,
                child: ScoringBoxCommunityWidget(
                    boxIndex: 26,
                    gameMode: widget.mode,
                    scoutData: widget.scoutData)),
          ],
        ),
      ],
    );
  }
}
