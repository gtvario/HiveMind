import 'dart:convert';
import 'package:http/http.dart' as http;

import 'events_model.dart';
import 'package:hivemind/models/match_model.dart';

const apiKey =
    'T3lcH7N2Om2stFrcLJtj8RfQQhSOIbRJj9XDSNDxJoJewHPEBjPKh7wZ7eTOVlxu';
const server = 'https://www.thebluealliance.com/api/v3';
Map<String, String> header = {"X-TBA-Auth-Key": apiKey};

Future<List<Event>> fetchEvents(teamKey, year) async {
  String url = '$server/team/$teamKey/events/$year';

  final dynamic parsed;

  final response = await http.get(
    Uri.parse(url),
    headers: header,
  );

  if (response.statusCode == 200) {
    parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  } else {
    throw Exception('Request Failed');
  }
}

Future<List<FRCMatch>> fetchMatches(eventKey) async {
  String url = '$server/event/$eventKey/matches/simple';
  final dynamic parsed;
  final response = await http.get(
    Uri.parse(url),
    headers: header,
  );
  if (response.statusCode == 200) {
    parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<FRCMatch>((json) => FRCMatch.fromJson(json)).toList();
  } else {
    throw Exception('Request Failed');
  }
}
