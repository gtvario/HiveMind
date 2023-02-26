import 'package:flutter/material.dart';
import 'package:hivemind/widgets/counter_box_widget.dart';

class PreloadWidget extends StatefulWidget {
  const PreloadWidget({super.key});

  @override
  State<PreloadWidget> createState() => _PreloadWidgetState();
}

class _PreloadWidgetState extends State<PreloadWidget> {
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
      Column(
        children: [
          const Text(
            "Preload?",
            style: TextStyle(
              fontSize: 65,
              fontFamily: 'Schyler',
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (!preloadCone) {
                          coneImgPath = 'assets/images/cone_new_check.png';
                          preloadCone = true;
                          if (preloadCube) {
                            cubeImgPath = 'assets/images/cube_new.png';
                            preloadCube = false;
                          }
                        } else {
                          coneImgPath = 'assets/images/cone_new.png';
                          preloadCone = false;
                        }
                      });
                    },
                    child: Image.asset(coneImgPath),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (!preloadCube) {
                          cubeImgPath = 'assets/images/cube_new_check.png';
                          preloadCube = true;
                          if (preloadCone) {
                            coneImgPath = 'assets/images/cone_new.png';
                            preloadCone = false;
                          }
                        } else {
                          cubeImgPath = 'assets/images/cube_new.png';
                          preloadCube = false;
                        }
                      });
                    },
                    child: Image.asset(cubeImgPath),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 50),
      Column(
        children: [
          const Text(
            "Auton Movement?",
            style: TextStyle(
              fontSize: 65,
              fontFamily: 'Schyler',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: InkWell(
                  onTapDown: (details) {
                    setState(() {
                      if (!autoMovement) {
                        autoMovement = true;
                        autoMovementText = 'Yes';
                      } else {
                        autoMovement = false;
                        autoMovementText = 'No';
                      }
                    });
                  },
                  child: Text(
                    autoMovementText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      fontFamily: 'Schyler',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Auto Collect",
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
