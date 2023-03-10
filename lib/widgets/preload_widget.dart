import 'package:flutter/material.dart';

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
          Row(
            children: const [
              Text(
                "Preload?",
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Schyler',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 75,
                height: 75,
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
              const SizedBox(width: 20),
              SizedBox(
                width: 75,
                height: 75,
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
            ],
          ),
        ],
      ),
    ]);
  }
}
