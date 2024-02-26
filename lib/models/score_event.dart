class ScoreEvent {
  int speakMade = 0, speakMiss = 0, zone = 0;

  ScoreEvent();

  @override
  String toString() {
    String output = "Zone $zone";

    if (speakMade != 0) {
      output = "Speaker Made at $output";
    } else {
      output = "Speaker Miss at $output";
    }

    return output;
  }

  getJson() {
    var obj = {
      "ScoreEvent$zone$speakMade$speakMiss": {
        "zone": zone,
        "speakMade": speakMade,
        "speakMiss": speakMiss
      }
    };
    return obj;
  }

  set setZone(int zoneNum) {
    zone = zoneNum;
  }

  set setSpeakMade(int speakerMade) {
    speakMade = speakerMade;
  }

  set setSpeakMiss(int speakerMiss) {
    speakMiss = speakerMiss;
  }

  // Getters
  int get getZoneNum {
    return zone;
  }

  int get getSpeakMade {
    return speakMade;
  }

  int get getSpeakMiss {
    return speakMiss;
  }
}
