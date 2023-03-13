import 'package:flutter/material.dart';

class DroppedCubeCollectWidget extends StatefulWidget {
  const DroppedCubeCollectWidget({super.key});

  @override
  State<DroppedCubeCollectWidget> createState() =>
      _DroppedCubeCollectWidgetState();
}

class _DroppedCubeCollectWidgetState extends State<DroppedCubeCollectWidget> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Dropped Cube",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _itemCount++;
            });
          },
          child: SizedBox(
            width: 85,
            height: 85,
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
          },
          child: SizedBox(
            width: 50,
            height: 50,
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
