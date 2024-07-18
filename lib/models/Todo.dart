import 'package:flutter/foundation.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo(
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
