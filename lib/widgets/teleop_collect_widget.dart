import 'package:flutter/material.dart';
import 'package:hivemind/widgets/counter_box_widget.dart';

class TeleopCollectWidget extends StatefulWidget {
  const TeleopCollectWidget({super.key});

  @override
  State<TeleopCollectWidget> createState() => _TeleopCollectWidgetState();
}

class _TeleopCollectWidgetState extends State<TeleopCollectWidget> {
  String coneImgPath = 'assets/images/cone_new.png';
  String cubeImgPath = 'assets/images/cube_new.png';
  String autoCollectConeImgPath = 'assets/images/cone_new.png';
  String autoCollectCubeImgPath = 'assets/images/cube_new.png';
  String autoMovementText = 'No';
  bool preloadCone = false;
  bool preloadCube = false;
  bool autoCollectCone = false;
  bool autoCollectCube = false;
  bool autoMovement = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Teleop Collect",
          style: TextStyle(
            fontSize: 65,
            fontFamily: 'Schyler',
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(autoCollectConeImgPath),
          ),
          CounterBox(),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(autoCollectCubeImgPath),
          ),
          CounterBox(),
        ]),
      ]),
    ]);
  }
}
