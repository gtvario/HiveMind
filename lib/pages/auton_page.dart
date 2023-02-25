import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/scoring_widget.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

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
            //color: Colors.green,
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
            //color: Colors.blue,
            child: Column(
              children: const <Widget>[
                PreloadWidget(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: Column(
              children: const <Widget>[
                Scoring(),
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

class CounterBox extends StatelessWidget {
  const CounterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: NumberInputPrefabbed.roundedButtons(
        controller: TextEditingController(),
        enabled: true,
        incDecBgColor: Colors.amber,
        buttonArrangement: ButtonArrangement.incRightDecLeft,
      ),
    );
  }
}
