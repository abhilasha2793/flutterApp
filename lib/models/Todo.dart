import 'package:flutter/foundation.dart';

/// A data model class for Todo

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      this.completed = false});

  factory Todo.fromJson(Map<String, dynamic> data) {
    return Todo(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
      completed: data['completed'],
    );
  }
}
