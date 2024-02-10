import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ChainHang extends StatefulWidget {
  final String mode;
  final ScoutData scoutData;

  const ChainHang({super.key, required this.mode, required this.scoutData});

  @override
  State<ChainHang> createState() => _ChainHangState();
}

class _ChainHangState extends State<ChainHang> {
  String hangState = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.scoutData.getChainHang != "") {
        hangState = widget.scoutData.getChainHang;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Stage Status',
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
                value: 'Hanging',
                groupValue: hangState,
                onChanged: (value) {
                  setState(() {
                    hangState = value.toString();
                    widget.scoutData.setChainHang = hangState;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Hanging',
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
                value: 'Parked',
                groupValue: hangState,
                onChanged: (value) {
                  setState(() {
                    hangState = value.toString();
                    widget.scoutData.setChainHang = hangState;
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
                value: 'Neither',
                groupValue: hangState,
                onChanged: (value) {
                  setState(() {
                    hangState = value.toString();
                    widget.scoutData.setChainHang = hangState;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Neither',
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
