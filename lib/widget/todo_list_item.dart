import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/Todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo task;

  TodoListItem({super.key, required this.task});

  void _onChanged(bool value) {
    if (kDebugMode) {
      print('Task completed : $value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0)),
          child: ListTile(
            leading: Checkbox(
                value: task.completed,
                onChanged: (value) {
                  _onChanged(value!);
                }),
            title: Text(
              task.title,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ));
  }
}
