import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class RobotCondition extends StatefulWidget {
  final ScoutData scoutData;
  const RobotCondition({super.key, required this.scoutData});

  @override
  State<RobotCondition> createState() => _RobotConditionState();
}

class _RobotConditionState extends State<RobotCondition> {
  String robotConditionState = "";
  List<String> selectedValues = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.scoutData.getRobotCondition == "") {
        selectedValues.add('No');
        widget.scoutData.setRobotCondition = selectedValues.join(', ');
      } else {
        selectedValues = widget.scoutData.getRobotCondition.split(', ');
      }
    });
  }

  // Method to toggle the selection of a value
  void toggleSelection(String value) {
    setState(() {
      if (selectedValues.contains(value)) {
        selectedValues.remove(value);
      } else {
        selectedValues.add(value);
        if (selectedValues.contains('No')) {
          selectedValues.remove('No');
        }
      }

      // If nothing else is selected, default to 'No'
      if (selectedValues.isEmpty) {
        selectedValues.add('No');
      }
      widget.scoutData.setRobotCondition = selectedValues.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Did the Robot Break?',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'No',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues.contains('No'),
          onChanged: (value) {
            // Do nothing;
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'Did not move for the whole match',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues.contains('Did not move for the whole match'),
          onChanged: (value) {
            toggleSelection('Did not move for the whole match');
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'Completely stopped for part of the match',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues
              .contains('Completely stopped for part of the match'),
          onChanged: (value) {
            toggleSelection('Completely stopped for part of the match');
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'Partially working',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues.contains('Partially working'),
          onChanged: (value) {
            toggleSelection('Partially working');
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'A mechanism broke (elaborate in comments)',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues
              .contains('A mechanism broke (elaborate in comments)'),
          onChanged: (value) {
            toggleSelection('A mechanism broke (elaborate in comments)');
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'Fell over :(',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues.contains('Fell over :('),
          onChanged: (value) {
            toggleSelection('Fell over :(');
          },
        ),
        CheckboxListTile(
          dense: true,
          title: const Text(
            'Note got stuck in the robot',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
            ),
          ),
          value: selectedValues.contains('Note got stuck in the robot'),
          onChanged: (value) {
            toggleSelection('Note got stuck in the robot');
          },
        ),
      ],
    );
  }
}
