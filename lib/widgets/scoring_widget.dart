import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class Scoring extends StatefulWidget {
  const Scoring({super.key});

  @override
  State<Scoring> createState() => _ScoringState();
}

class _ScoringState extends State<Scoring> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("Scoring"),
          ),
          Text("High"),
          Text("Mid"),
          Text("Low"),
          CounterBox(),
          CounterBox(),
          CounterBox(),
          CounterBox(),
          CounterBox(),
        ],
      ),
    );
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
        incDecBgColor: Colors.amber,
        buttonArrangement: ButtonArrangement.incRightDecLeft,
      ),
    );
  }
}
