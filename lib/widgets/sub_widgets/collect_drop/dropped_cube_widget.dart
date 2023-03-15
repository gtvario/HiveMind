import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class DroppedCubeCollectWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const DroppedCubeCollectWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<DroppedCubeCollectWidget> createState() =>
      _DroppedCubeCollectWidgetState();
}

class _DroppedCubeCollectWidgetState extends State<DroppedCubeCollectWidget> {
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'auton') {
      _itemCount = widget.scoutData.getDroppedAutoCube;
    } else {
      _itemCount = widget.scoutData.getDroppedTeleopCube;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Dropped Cube",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _itemCount++;
            });
            if (widget.mode == 'auton') {
              widget.scoutData.setDroppedAutoCube = _itemCount;
            } else {
              widget.scoutData.setDroppedTeleopCube = _itemCount;
            }
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: const Color.fromARGB(255, 225, 132, 241)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _itemCount.toString(),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_itemCount > 0) {
                _itemCount--;
              }
            });
            if (widget.mode == 'auton') {
              widget.scoutData.setDroppedAutoCube = _itemCount;
            } else {
              widget.scoutData.setDroppedTeleopCube = _itemCount;
            }
          },
          child: SizedBox(
            width: 35,
            height: 35,
            child: Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(3.0),
              child: Image.asset('assets/images/down_arrow.png'),
            ),
          ),
        ),
      ],
    );
  }
}
