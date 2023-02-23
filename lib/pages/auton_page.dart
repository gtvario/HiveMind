import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/scoring_widget.dart';

class AutonPage extends StatelessWidget {
  const AutonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.green,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/2023_FieldImage.jpg',
              width: 300,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: const <Widget>[
                PreloadWidget(),
                //Scoring(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Column(
              children: const <Widget>[
                ChargeStation(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PreloadWidget extends StatefulWidget {
  const PreloadWidget({super.key});

  @override
  State<PreloadWidget> createState() => _PreloadWidgetState();
}

class _PreloadWidgetState extends State<PreloadWidget> {
  String coneImgPath = 'assets/images/cone.png';
  String cubeImgPath = 'assets/images/cube.jpg';
  String autoCollectConeImgPath = 'assets/images/cone.png';
  String autoCollectCubeImgPath = 'assets/images/cube.jpg';
  String autoMovementText = 'No';
  bool preloadCone = false;
  bool preloadCube = false;
  bool autoCollectCone = false;
  bool autoCollectCube = false;
  bool autoMovement = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
                            coneImgPath = 'assets/images/cone_selected.png';
                            preloadCone = true;
                            if (preloadCube) {
                              cubeImgPath = 'assets/images/cube.jpg';
                              preloadCube = false;
                            }
                          } else {
                            coneImgPath = 'assets/images/cone.png';
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
                            cubeImgPath = 'assets/images/cube_selected.jpg';
                            preloadCube = true;
                            if (preloadCone) {
                              coneImgPath = 'assets/images/cone.png';
                              preloadCone = false;
                            }
                          } else {
                            cubeImgPath = 'assets/images/cube.jpg';
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
        Column(
          children: [
            const Text(
              "Auto Collect",
              style: TextStyle(
                fontSize: 65,
                fontFamily: 'Schyler',
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (!autoCollectCone) {
                          autoCollectConeImgPath =
                              'assets/images/cone_selected.png';
                          autoCollectCone = true;
                        } else {
                          autoCollectConeImgPath = 'assets/images/cone.png';
                          autoCollectCone = false;
                        }
                      });
                    },
                    child: Image.asset(autoCollectConeImgPath),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTapDown: (details) {
                      setState(() {
                        if (!autoCollectCube) {
                          autoCollectCubeImgPath =
                              'assets/images/cube_selected.jpg';
                          autoCollectCube = true;
                        } else {
                          autoCollectCubeImgPath = 'assets/images/cube.jpg';
                          autoCollectCube = false;
                        }
                      });
                    },
                    child: Image.asset(autoCollectCubeImgPath),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class StartingPosition extends StatefulWidget {
  const StartingPosition({super.key});

  @override
  State<StartingPosition> createState() => _StartingPositionState();
}

class _StartingPositionState extends State<StartingPosition> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
