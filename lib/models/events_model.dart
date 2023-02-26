import 'package:hivemind/models/database.dart';

class Event {
  String? eventKey;
  String? eventName;
  int? eventYear;
  final dbHelper = DatabaseHelper();

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

  Future insertDb() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: eventKey,
      DatabaseHelper.columnName: eventName,
      DatabaseHelper.columnYear: eventYear
    };
    final id = await dbHelper.insert(row);
  }

  Future<List<Map<String, dynamic>>> queryDb() async {
    List<Map<String, dynamic>> result =
        await dbHelper.query("SELECT * WHERE year='2022'");

    return result;
  }

  @override
  String toString() {
    return "($eventKey,$eventName,$eventYear)";
  }
}
