library hivemind.globals;

import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

int queenPassword = 8675309;

enum ScoringStation { speakerMade, speakerMissed, ampMade, ampMissed }

List<String> studentList = [
  'Select Student Name',
  'Alondra Pedroza',
  'Anna Lis',
  'Bryce Whigham',
  'Clint Kanda',
  'Damion Osborne',
  'Daniel Kim',
  'Ethan Dhomnic',
  'Iden Konja',
  'Bella Stamatti',
  'Jack Stetson',
  'Jose Puente',
  'Loreena Zondag',
  'Mary Rose Montales',
  'Max Goss',
  'Olivia Guliford',
  'Quinn Thomas',
  'Sean Choi',
  'Mentor',
  '7762 Student'
];

Future<String?> get _localPath async {
  final directory = await getExternalStorageDirectory();

  return directory?.path;
}

Future<io.File> _localFile(eventKey) async {
  final path = await _localPath;

  return io.File('$path/MatchSchedules/$eventKey.json');
}
