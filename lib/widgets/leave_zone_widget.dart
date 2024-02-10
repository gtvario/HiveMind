import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class LeaveZone extends StatefulWidget {
  final ScoutData scoutData;
  const LeaveZone({super.key, required this.scoutData});

  @override
  State<LeaveZone> createState() => _LeaveZoneState();
}

class _LeaveZoneState extends State<LeaveZone> {
  bool zoneLeft = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      zoneLeft = widget.scoutData.getLeaveZone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: zoneLeft,
      activeColor: Colors.amber,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          zoneLeft = value;
        });
        widget.scoutData.setLeaveZone = zoneLeft;
      },
    );
  }
}
