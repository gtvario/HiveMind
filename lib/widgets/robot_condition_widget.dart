import 'package:flutter/material.dart';

class RobotCondition extends StatefulWidget {
  const RobotCondition({super.key});

  @override
  State<RobotCondition> createState() => _RobotConditionState();
}

class _RobotConditionState extends State<RobotCondition> {
  String? robotConditionState;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Did the\nRobot Break?',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'No',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'No',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'Did not move for the whole match',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Did not move for\nthe whole match',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'Completely stopped for part of the match',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Completely stopped\nfor part of the match',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'Partially working',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Partially working',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'A mechanism broke (elaborate in comments)',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'A mechanism broke\n(elaborate in comments)',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Radio(
                activeColor: Colors.amber,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 'Fell over :(',
                groupValue: robotConditionState,
                onChanged: (value) {
                  setState(() {
                    robotConditionState = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Fell over :(',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
