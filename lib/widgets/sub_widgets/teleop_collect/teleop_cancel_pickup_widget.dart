import 'package:flutter/material.dart';

class CancelCollectWidget extends StatefulWidget {
  const CancelCollectWidget({super.key});

  @override
  State<CancelCollectWidget> createState() => _CancelCollectWidgetState();
}

class _CancelCollectWidgetState extends State<CancelCollectWidget> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _itemCount++;
          });
        },
        child: Column(
          children: [
            const Text(
              "\nCancel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: 85,
              height: 85,
              child: Container(
                margin: const EdgeInsets.all(2.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
