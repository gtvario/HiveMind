import 'package:flutter/material.dart';
import 'package:hivemind/pages/auton_page.dart';
import 'package:hivemind/pages/auton_page_2.dart';
import 'package:hivemind/models/match_scout_vars.dart';
import 'package:hivemind/pages/endgame_page.dart';
import 'package:hivemind/pages/teleop_page.dart';

class MatchScoutPage extends StatefulWidget {
  const MatchScoutPage({super.key});

  @override
  State<MatchScoutPage> createState() => _MatchScoutPageState();
}

class _MatchScoutPageState extends State<MatchScoutPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hivemind TBA Events'),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          Center(
            child: AutonPage2(),
          ),
          Center(
            child: AutonPage(),
          ),
          Center(
            child: TeleopPage(),
          ),
          Center(
            child: EndgamePage(),
          ),
        ],
      ),
    );
  }
}
