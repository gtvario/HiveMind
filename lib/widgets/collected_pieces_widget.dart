import 'package:flutter/material.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_HP_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_cone_widget.dart';
import 'package:hivemind/widgets/sub_widgets/collect_drop/pickup_cube_widget.dart';

class TeleopCollectWidget extends StatefulWidget {
  const TeleopCollectWidget({super.key});

  @override
  State<TeleopCollectWidget> createState() => _TeleopCollectWidgetState();
}

class _TeleopCollectWidgetState extends State<TeleopCollectWidget> {
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
          children: const [
            SizedBox(width: 75, height: 135, child: HP_CollectWidget()),
            SizedBox(width: 5),
            SizedBox(width: 75, height: 135, child: ConeCollectWidget()),
            SizedBox(width: 5),
            SizedBox(width: 75, height: 135, child: CubeCollectWidget()),
          ],
        ),
      ],
    );
  }
}
