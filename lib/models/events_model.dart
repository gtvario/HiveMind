import 'dart:convert';

class Event {
  String? eventKey;
  String? eventName;
  int? eventYear;

  Event({
    this.eventKey,
    this.eventName,
    this.eventYear,
  });

  Event.fromJson(Map<String, dynamic> json) {
    eventKey = json['key'];
    eventName = json['name'];
    eventYear = json['year'];
  }

  @override
  String toString() {
    return "($eventKey,$eventName,$eventYear)";
  }
}
