import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class SubmitDataPage extends StatefulWidget {
  final ScoutData scoutData;
  const SubmitDataPage({super.key, required this.scoutData});

  @override
  State<SubmitDataPage> createState() => _SubmitDataPageState();
}

class _SubmitDataPageState extends State<SubmitDataPage> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    commentController.text = widget.scoutData.getComments;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: [
        const SizedBox(width: 35),
        SizedBox(
          width: 500,
          child: TextField(
            onChanged: (value) {
              widget.scoutData.setComments = value;
            },
            controller: commentController,
            style: const TextStyle(
              fontSize: 24,
            ),
            keyboardType: TextInputType.multiline,
            minLines: 10,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Comments',
            ),
          ),
        ),
        const SizedBox(width: 35),
        Column(
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Are you sure?',
                          textAlign: TextAlign.center,
                        ),
                        content: const Text('Do you want to Submit?',
                            textAlign: TextAlign.center),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text('No',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.red[900])),
                          ),
                          const SizedBox(width: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              widget.scoutData.writeFile();
                              Navigator.pop(context);
                            },
                            child: Text('Yes',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.green[700])),
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
        ),
      ])
    ]);
  }
}
