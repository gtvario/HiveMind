import 'package:flutter/material.dart';
import 'package:hivemind/widgets/charge_station_widget.dart';
import 'package:hivemind/widgets/auton_scoring_widget.dart';
import 'package:hivemind/widgets/preload_widget.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class AutonPage extends StatelessWidget {
  const AutonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            //color: Colors.green,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/2023_FieldImage.jpg',
              width: 300,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            //color: Colors.blue,
            child: Column(
              children: const <Widget>[
                PreloadWidget(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: Column(
              children: const <Widget>[
                Scoring(),
                ChargeStation(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StartingPosition extends StatefulWidget {
  const StartingPosition({super.key});

  @override
  State<StartingPosition> createState() => _StartingPositionState();
}

class _StartingPositionState extends State<StartingPosition> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CounterBox extends StatelessWidget {
  const CounterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: NumberInputPrefabbed.roundedButtons(
        controller: TextEditingController(),
        enabled: true,
        incDecBgColor: Colors.amber,
        buttonArrangement: ButtonArrangement.incRightDecLeft,
      ),
    );
  }
}
