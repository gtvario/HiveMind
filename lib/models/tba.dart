import 'dart:convert';
import 'package:http/http.dart' as http;

import 'events_model.dart';

const apiKey =
    'T3lcH7N2Om2stFrcLJtj8RfQQhSOIbRJj9XDSNDxJoJewHPEBjPKh7wZ7eTOVlxu';
const server = 'https://www.thebluealliance.com/api/v3';

Future<List<Event>> fetchEvents() async {
  String url = '$server/team/frc33/events/2023';
  Map<String, String> header = {"X-TBA-Auth-Key": apiKey};
  List<Event> eventsList;
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
