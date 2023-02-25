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
    return Column(
      children: <Widget>[
        const Text(
          'Charging Station',
          style: TextStyle(
            fontSize: 65,
            fontFamily: 'Schyler',
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 150),
            Transform.scale(
              scale: 1.5,
              child: Radio(
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
                },
              ),
            ),
            const Text(
              'Attempted',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 150),
            Transform.scale(
              scale: 1.5,
              child: Radio(
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
                },
              ),
            ),
            const Text(
              'Engaged',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 150),
            Transform.scale(
              scale: 1.5,
              child: Radio(
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
                },
              ),
            ),
            const Text(
              'Parked',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 150),
            Transform.scale(
              scale: 1.5,
              child: Radio(
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
                },
              ),
            ),
            const Text(
              'Did Not Attempt',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
