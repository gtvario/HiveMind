import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class SubmitDataPage extends StatefulWidget {
  final ScoutData scoutData;
  const SubmitDataPage({super.key, required this.scoutData});

  @override
  State<SubmitDataPage> createState() => _SubmitDataPageState();
}

class _SubmitDataPageState extends State<SubmitDataPage> {
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to Submit?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          widget.scoutData.writeFile();
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
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
