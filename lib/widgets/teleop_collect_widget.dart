import 'package:flutter/material.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_collect/teleop_HP_pickup_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_collect/teleop_cone_pickup_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_collect/teleop_cube_pickup_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_collect/teleop_cancel_pickup_widget.dart';
import 'package:hivemind/widgets/sub_widgets/teleop_collect/teleop_drop_pickup_widget.dart';

class TeleopCollectWidget extends StatefulWidget {
  const TeleopCollectWidget({super.key});

  @override
  State<TeleopCollectWidget> createState() => _TeleopCollectWidgetState();
}

class _TeleopCollectWidgetState extends State<TeleopCollectWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 100, height: 225, child: HP_CollectWidget()),
        SizedBox(width: 5),
        SizedBox(width: 100, height: 225, child: ConeCollectWidget()),
        SizedBox(width: 5),
        SizedBox(width: 100, height: 225, child: CubeCollectWidget()),
        SizedBox(width: 5),
        SizedBox(width: 100, height: 225, child: DropCollectWidget()),
        SizedBox(width: 5),
        SizedBox(width: 100, height: 225, child: CancelCollectWidget()),
      ],
    );
  }
}
