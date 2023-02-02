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
    return Transform.scale(
      scale: 0.5,
      child: Transform.scale(
        scale: 1.25,
        child: Column(
          children: <Widget>[
            const Text("Score"),
            Table(
              border: const TableBorder(
                horizontalInside: BorderSide(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                verticalInside: BorderSide(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/cone.png",
                      height: 100,
                      width: 100,
                    ),
                    Image.asset(
                      "assets/images/cube.jpg",
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    Text("High"),
                    CounterBox(),
                    CounterBox(),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    Text("Mid"),
                    CounterBox(),
                    CounterBox(),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    Text("Low"),
                    CounterBox(),
                    CounterBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
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
