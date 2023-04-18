import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class HybridSuperChargedConeCollectWidget extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;
  const HybridSuperChargedConeCollectWidget(
      {super.key, required this.mode, required this.scoutData});

  @override
  State<HybridSuperChargedConeCollectWidget> createState() =>
      _HybridSuperChargedConeCollectWidgetState();
}

class _HybridSuperChargedConeCollectWidgetState
    extends State<HybridSuperChargedConeCollectWidget> {
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.scoutData.getDroppedTeleopCone;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Supercharged Cone",
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
            widget.scoutData.setDroppedTeleopCone = _itemCount;
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.yellow),
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
            widget.scoutData.setDroppedTeleopCone = _itemCount;
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
