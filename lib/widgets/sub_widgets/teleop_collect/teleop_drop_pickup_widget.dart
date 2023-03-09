import 'package:flutter/material.dart';

class DropCollectWidget extends StatefulWidget {
  const DropCollectWidget({super.key});

  @override
  State<DropCollectWidget> createState() => _DropCollectWidgetState();
}

class _DropCollectWidgetState extends State<DropCollectWidget> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "\nDropped",
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
                  border: Border.all(color: Colors.black), color: Colors.grey),
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
