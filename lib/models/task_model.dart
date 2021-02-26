import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  DateTime date;
  TimeOfDay time;
  String priority;
  int status;

  Task({this.title, this.date, this.time, this.priority, this.status});

  Task.withId(
      {this.id, this.title, this.date, this.time, this.priority, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['time'] = time.toString();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['time']),
      time: map['time'],
      priority: map['priority'],
      status: map['status'],
    );
  }
}
