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
  String _radioValue = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.scoutData.getChainHang == "") {
        hangState = "No";
        widget.scoutData.setRobotCondition = hangState;
      } else {
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
          'Did They Hang',
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
                value: 'Yes',
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
              'Yes',
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
                value: 'No',
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
              'No',
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
                value: 'Attempted',
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
                value: 'Did Not Attempt',
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
