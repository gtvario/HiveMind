import 'package:flutter/material.dart';

class LeaveZone extends StatefulWidget {
  const LeaveZone({super.key});

  @override
  State<LeaveZone> createState() => _LeaveZoneState();
}

class _LeaveZoneState extends State<LeaveZone> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.yellow,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
