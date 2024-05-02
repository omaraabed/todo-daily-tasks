import 'dart:convert';

class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool statue;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.date,
      required this.description,
      required this.statue});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          date: json['date'],
          statue: json['statue'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'statue': statue,
    };
  }
}
