import 'package:flutter/material.dart';
import 'package:hivemind/pages/home_page.dart';
import 'package:hivemind/pages/match_scout_page.dart';
import 'package:hivemind/pages/teleop_page.dart';
import 'package:hivemind/pages/auton_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hivemind',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        initialRoute: "/scout",
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => const HomePage(),
          "/scout": (BuildContext context) => const MatchScoutPage(),
        });
  }
}
