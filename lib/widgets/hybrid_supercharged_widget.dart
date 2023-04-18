import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/hybrid_SC_cone_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_score/hybrid_SC_cube_widget.dart';

class HybridSuperChargedWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const HybridSuperChargedWidget(
      {super.key, required this.scoutData, required this.mode});

  @override
  State<HybridSuperChargedWidget> createState() =>
      _HybridSuperChargedWidgetState();
}

class _HybridSuperChargedWidgetState extends State<HybridSuperChargedWidget> {
  @override
  void initState() {
    super.initState();
    widget.scoutData.readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Hybrid Supercharged',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 7.5),
        Row(
          children: [
            SizedBox(
                width: 110,
                height: 135,
                child: HybridSuperChargedConeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
            const SizedBox(width: 5),
            SizedBox(
                width: 110,
                height: 135,
                child: HybridSuperChargedCubeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
          ],
        ),
      ],
    );
  }
}
