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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Charging\nStation',
          style: TextStyle(
            fontSize: 45,
            fontFamily: 'Schyler',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.scale(
              scale: 2.0,
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
            )
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 2.0,
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
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            Transform.scale(
              scale: 2.0,
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
        const SizedBox(height: 25),
        Row(
          children: [
            Transform.scale(
              scale: 2.0,
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
}
