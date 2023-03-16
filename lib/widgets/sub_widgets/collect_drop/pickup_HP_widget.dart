// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class HP_CollectWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const HP_CollectWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<HP_CollectWidget> createState() => _HP_CollectWidgetState();
}

class _HP_CollectWidgetState extends State<HP_CollectWidget> {
  int _itemCount = 0;
  @override
  void initState() {
    super.initState();
    readScoutFile().then((value) {
      setState(() {
        if (widget.mode == "auton") {
          _itemCount = widget.scoutData.getHPStationAuto;
        } else {
          _itemCount = widget.scoutData.getHPStationTeleop;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "HP\nStation",
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
              widget.scoutData.setHPStationAuto = _itemCount;
            } else {
              widget.scoutData.setHPStationTeleop = _itemCount;
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
                  color: Colors.lightGreen),
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
              widget.scoutData.setHPStationAuto = _itemCount;
            } else {
              widget.scoutData.setHPStationTeleop = _itemCount;
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

  Future<void> readScoutFile() async {
    await widget.scoutData.readFile();
  }
}
