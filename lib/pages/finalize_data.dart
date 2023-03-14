import 'package:flutter/material.dart';

class SumbitDataPage extends StatefulWidget {
  const SumbitDataPage({super.key});

  @override
  State<SumbitDataPage> createState() => _SumbitDataPageState();
}

class _SumbitDataPageState extends State<SumbitDataPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/HEX_BEE_33_BLACK.png',
          width: 350,
          height: 350,
        ),
        const SizedBox(height: 50),
        Center(
          child: SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 36, fontFamily: 'Schyler'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
