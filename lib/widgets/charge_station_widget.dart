import 'package:flutter/material.dart';

class ChargeStation extends StatefulWidget {
  const ChargeStation({super.key});

  @override
  State<ChargeStation> createState() => _ChargeStationState();
}

class _ChargeStationState extends State<ChargeStation> {
  String? chargeStationState;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      width: 200,
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Charge Station",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          RadioListTile(
              title: const Text('Engaged'),
              value: 'Engaged',
              groupValue: chargeStationState,
              onChanged: (value) {
                setState(() {
                  chargeStationState = value.toString();
                });
              }),
          RadioListTile(
              title: const Text('Docked'),
              value: 'Docked',
              groupValue: chargeStationState,
              onChanged: (value) {
                setState(() {
                  chargeStationState = value.toString();
                });
              }),
          RadioListTile(
              title: const Text('Parked'),
              value: 'Parked',
              groupValue: chargeStationState,
              onChanged: (value) {
                setState(() {
                  chargeStationState = value.toString();
                });
              }),
          RadioListTile(
              title: const Text('Attempted'),
              value: 'Attempted',
              groupValue: chargeStationState,
              onChanged: (value) {
                setState(() {
                  chargeStationState = value.toString();
                });
              }),
          RadioListTile(
              title: const Text('Did Not Attempt'),
              value: 'Did Not Attempt',
              groupValue: chargeStationState,
              onChanged: (value) {
                setState(() {
                  chargeStationState = value.toString();
                });
              }),
        ],
      ),
    );
  }
}
