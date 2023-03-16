import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_HP_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_cone_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_cube_widget.dart';

class TeleopCollectWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const TeleopCollectWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<TeleopCollectWidget> createState() => _TeleopCollectWidgetState();
}

class _TeleopCollectWidgetState extends State<TeleopCollectWidget> {
  @override
  void initState() {
    super.initState();
    readScoutFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Picked Up',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 7.5),
        Row(
          children: [
            SizedBox(
                width: 75,
                height: 135,
                child: HP_CollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
            const SizedBox(width: 5),
            SizedBox(
                width: 75,
                height: 135,
                child: ConeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
            const SizedBox(width: 5),
            SizedBox(
                width: 75,
                height: 135,
                child: CubeCollectWidget(
                  mode: widget.mode,
                  scoutData: widget.scoutData,
                )),
          ],
        ),
      ],
    );
  }

  Future<void> readScoutFile() async {
    await widget.scoutData.readFile();
  }
}
