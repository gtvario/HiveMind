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
              fontSize: 45,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 15),
        Row(
          children: const [
            SizedBox(width: 100, height: 225, child: HP_CollectWidget()),
            SizedBox(width: 5),
            SizedBox(width: 100, height: 225, child: ConeCollectWidget()),
            SizedBox(width: 5),
            SizedBox(width: 100, height: 225, child: CubeCollectWidget()),
          ],
        ),
      ],
    );
  }
}
