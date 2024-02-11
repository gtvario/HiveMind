import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class ChainHang extends StatefulWidget {
  final ScoutData scoutData;

  const ChainHang({super.key, required this.scoutData});

  @override
  State<ChainHang> createState() => _ChainHangState();
}

class _ChainHangState extends State<ChainHang> {
  String hangState = "";
  String parkedState = "";
  bool isDisabled = false;

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
                    isDisabled = true;
                    hangState = value.toString();
                    parkedState = 'No';
                    widget.scoutData.setChainHang = hangState;
                    widget.scoutData.setOnstageParked = 0;
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
                    isDisabled = false;
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
                value: 'Attempted But Failed',
                groupValue: hangState,
                onChanged: (value) {
                  setState(() {
                    isDisabled = false;
                    hangState = value.toString();
                    widget.scoutData.setChainHang = hangState;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Attempted But Failed',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 35),
        const Text(
          'Park Status',
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
                groupValue: parkedState,
                onChanged: isDisabled
                    ? null
                    : (value) {
                        setState(() {
                          parkedState = value.toString();
                          widget.scoutData.setChainHang = parkedState;
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
                groupValue: parkedState,
                onChanged: isDisabled
                    ? null
                    : (value) {
                        setState(() {
                          parkedState = value.toString();
                          widget.scoutData.setChainHang = parkedState;
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
      ],
    );
  }
}
