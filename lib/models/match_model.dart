class FRCMatch {
  String? eventKey, matchType;
  int? matchNumber;
  List? redAlliance, blueAlliance;

  FRCMatch({
    this.eventKey,
    this.matchNumber,
    this.redAlliance,
    this.blueAlliance,
  });

  FRCMatch.fromJson(Map<String, dynamic> json) {
    eventKey = json["event_key"];
    matchNumber = json["match_number"];
    redAlliance = json["alliances"]["blue"]["team_keys"];
    blueAlliance = json["alliances"]["red"]["team_keys"];
    matchType = json["comp_level"];
  }

  @override
  String toString() {
    return "(Key: $eventKey, Match: $matchNumber, Red: $redAlliance, Blue: $blueAlliance, Type: $matchType)";
  }
}
