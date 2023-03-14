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
  void initState() async {
    super.initState();
    await widget.scoutData.readFile();
    String preload = widget.scoutData.getAutoPreload;
    setState(() {
      if (preload == 'cube') {
        preloadCube = true;
        preloadCone = false;
      } else if (preload == 'cone') {
        preloadCube = false;
        preloadCone = true;
      } else {
        preloadCone = false;
        preloadCube = false;
      }
    });
  }

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
                  fontSize: 35,
                  fontFamily: 'Schyler',
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
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
                          widget.scoutData.setAutoPreload = 'none';
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
              const SizedBox(width: 20),
              SizedBox(
                width: 50,
                height: 50,
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
                          widget.scoutData.setAutoPreload = 'none';
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
          ),
        ],
      ),
    ]);
  }
}
