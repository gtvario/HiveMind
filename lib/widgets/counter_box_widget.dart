import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

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
        buttonArrangement: ButtonArrangement.rightEnd,
      ),
    );
  }
}
