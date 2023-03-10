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

  FRCMatch.fromProcessedJson(Map<String, dynamic> json) {
    eventKey = json["event_key"];
    matchNumber = json["match_number"];
    redAlliance = json["blue_alliance"];
    blueAlliance = json["red_alliance"];
    matchType = json["comp_level"];
  }

  Map<String, dynamic> toJson() => {
        'event_key': eventKey,
        'match_number': matchNumber,
        'blue_alliance': blueAlliance,
        'red_alliance': redAlliance,
        'comp_level': matchType,
      };

  @override
  String toString() {
    return "Match: $matchNumber, Red: $redAlliance, Blue: $blueAlliance";
  }
}
