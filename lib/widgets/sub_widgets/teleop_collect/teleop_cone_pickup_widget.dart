import 'package:flutter/material.dart';

class ConeCollectWidget extends StatefulWidget {
  const ConeCollectWidget({super.key});

  @override
  State<ConeCollectWidget> createState() => _ConeCollectWidgetState();
}

class _ConeCollectWidgetState extends State<ConeCollectWidget> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Field\nCone",
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
            width: 100,
            height: 100,
            child: Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
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
