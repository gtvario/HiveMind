import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class CubeCollectWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const CubeCollectWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<CubeCollectWidget> createState() => _CubeCollectWidgetState();
}

class _CubeCollectWidgetState extends State<CubeCollectWidget> {
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.mode == "auton") {
        _itemCount = widget.scoutData.getFieldCubeAuto;
      } else {
        _itemCount = widget.scoutData.getFieldCubeTeleop;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Field\nCube",
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
            if (widget.mode == "auton") {
              widget.scoutData.setFieldCubeAuto = _itemCount;
            } else {
              widget.scoutData.setFieldCubeTeleop = _itemCount;
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
                  color: Color.fromARGB(255, 225, 132, 241)),
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
            if (widget.mode == "auton") {
              widget.scoutData.setFieldCubeAuto = _itemCount;
            } else {
              widget.scoutData.setFieldCubeTeleop = _itemCount;
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
