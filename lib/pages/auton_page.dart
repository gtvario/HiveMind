import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/scoring_widget.dart';

class AutonPage extends StatelessWidget {
  const AutonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: const <Widget>[
              StartingPosition(),
            ],
          ),
          Column(
            children: const <Widget>[
              PreloadWidget(),
              Scoring(),
            ],
          ),
          Column(
            children: const <Widget>[
              ChargeStation(),
            ],
          ),
        ],
      ),
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
  bool coneSelected = false;
  bool cubeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: Column(
        children: [
          const Text(
            "Preload?",
            style: TextStyle(
              fontSize: 100,
              fontFamily: 'Schyler',
            ),
          ),
          Row(
            children: [
              SizedBox(
                child: InkWell(
                  onTapDown: (details) {
                    setState(() {
                      if (!coneSelected && !cubeSelected) {
                        coneImgPath = 'assets/images/cone_selected.png';
                        coneSelected = true;
                      } else {
                        coneImgPath = 'assets/images/cone.png';
                        coneSelected = false;
                      }
                    });
                  },
                  child: Image.asset(coneImgPath),
                ),
              ),
              SizedBox(
                child: InkWell(
                  onTapDown: (details) {
                    setState(() {
                      if (!coneSelected && !cubeSelected) {
                        cubeImgPath = 'assets/images/cube_selected.jpg';
                        cubeSelected = true;
                      } else {
                        cubeImgPath = 'assets/images/cube.jpg';
                        cubeSelected = false;
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
