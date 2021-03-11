class Task {
  int id;
  String title;
  DateTime date;
  DateTime time;
  String priority;
  int status; // 0 - Incomplete, 1 - Complete

  Task({this.title, this.date, this.time, this.priority, this.status});

  Task.withId(
      {this.id, this.title, this.date, this.time, this.priority, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['time'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      time: DateTime.parse(map['time']),
      priority: map['priority'],
      status: map['status'],
    );
  }
}
