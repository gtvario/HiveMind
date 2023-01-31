import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AutonPage extends StatelessWidget {
  const AutonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const PreloadWidget(),
    );
  }
}

class PreloadWidget extends StatefulWidget {
  const PreloadWidget({super.key});

  @override
  State<PreloadWidget> createState() => _PreloadWidgetState();
}

class _PreloadWidgetState extends State<PreloadWidget> {
  String coneImgPath = 'assets/images/cone.jpg';
  String cubeImgPath = 'assets/images/cube.jpg';
  bool coneSelected = false;
  bool cubeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: Material(
        child: Column(
          children: [
            const Text("Preload?"),
            Row(
              children: [
                InkWell(
                  onTapDown: (details) {
                    setState(() {
                      if (!coneSelected && !cubeSelected) {
                        coneImgPath = 'assets/images/cone_selected.jpg';
                        coneSelected = true;
                      } else {
                        coneImgPath = 'assets/images/cone.jpg';
                        coneSelected = false;
                      }
                    });
                  },
                  child: Image.asset(coneImgPath),
                ),
                InkWell(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
