import 'package:flutter/material.dart';
import 'package:hivemind/pages/home_page.dart';
import 'package:hivemind/pages/match_scout_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => const HomePage(),
          "/scout": (BuildContext context) => const MatchScoutPage(),
        });
  }
}
