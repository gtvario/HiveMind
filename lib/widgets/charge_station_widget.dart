import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ChargeStation extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;

  const ChargeStation({super.key, required this.mode, required this.scoutData});

  @override
  State<ChargeStation> createState() => _ChargeStationState();
}

class _ChargeStationState extends State<ChargeStation> {
  String chargeStationState = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Charging\nStation',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Schyler',
            decoration: TextDecoration.underline,
          ),
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
                value: 'Engaged',
                groupValue: chargeStationState,
                onChanged: (value) {
                  setState(() {
                    chargeStationState = value.toString();
                  });
                  setMatchData();
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Engaged',
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
                value: 'Attempted',
                groupValue: chargeStationState,
                onChanged: (value) {
                  setState(() {
                    chargeStationState = value.toString();
                  });
                  setMatchData();
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Attempted',
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
                value: 'Parked',
                groupValue: chargeStationState,
                onChanged: (value) {
                  setState(() {
                    chargeStationState = value.toString();
                  });
                  setMatchData();
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Parked',
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
                value: 'Did Not Attempt',
                groupValue: chargeStationState,
                onChanged: (value) {
                  setState(() {
                    chargeStationState = value.toString();
                  });
                  setMatchData();
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Did Not Attempt',
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

  setMatchData() {
    widget.scoutData.writeFile();
  }

  Future<void> readScoutFile() async {
    await widget.scoutData.readFile();
  }
}
