import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class PreloadWidget extends StatefulWidget {
  final ScoutData scoutData;
  const PreloadWidget({super.key, required this.scoutData});

  @override
  State<PreloadWidget> createState() => _PreloadWidgetState();
}

class _PreloadWidgetState extends State<PreloadWidget> {
  String coneImgPath = 'assets/images/cone_new.png';
  String cubeImgPath = 'assets/images/cube_new.png';
  bool preloadCone = false;
  bool preloadCube = false;

  @override
  void initState() {
    super.initState();
    readScoutFile().then(
      (value) {
        setState(() {
          String preload = widget.scoutData.getAutoPreload;

          if (preload == 'cube') {
            preloadCube = true;
            preloadCone = false;
            cubeImgPath = 'assets/images/cube_new_check.png';
            coneImgPath = 'assets/images/cone_new.png';
          } else if (preload == 'cone') {
            preloadCube = false;
            preloadCone = true;
            coneImgPath = 'assets/images/cone_new_check.png';
            cubeImgPath = 'assets/images/cube_new.png';
          } else {
            preloadCone = false;
            preloadCube = false;
            coneImgPath = 'assets/images/cone_new.png';
            cubeImgPath = 'assets/images/cube_new.png';
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Preload?",
          style: TextStyle(
            fontSize: 65,
            fontFamily: 'Schyler',
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 100,
          height: 100,
          child: InkWell(
            onTapDown: (details) {
              setState(() {
                if (!preloadCone) {
                  coneImgPath = 'assets/images/cone_new_check.png';
                  preloadCone = true;
                  widget.scoutData.setAutoPreload = 'cone';
                  if (preloadCube) {
                    cubeImgPath = 'assets/images/cube_new.png';
                    preloadCube = false;
                  }
                } else {
                  coneImgPath = 'assets/images/cone_new.png';
                  preloadCone = false;
                  widget.scoutData.setAutoPreload = 'none';
                }
              });
            },
            child: Image.asset(coneImgPath),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 100,
          height: 100,
          child: InkWell(
            onTapDown: (details) {
              setState(() {
                if (!preloadCube) {
                  cubeImgPath = 'assets/images/cube_new_check.png';
                  preloadCube = true;
                  widget.scoutData.setAutoPreload = 'cube';
                  if (preloadCone) {
                    coneImgPath = 'assets/images/cone_new.png';
                    preloadCone = false;
                  }
                } else {
                  cubeImgPath = 'assets/images/cube_new.png';
                  preloadCube = false;
                  widget.scoutData.setAutoPreload = 'none';
                }
              });
            },
            child: Image.asset(cubeImgPath),
          ),
        ),
      ],
    );
  }

  Future<void> readScoutFile() async {
    await widget.scoutData.readFile();
  }
}
