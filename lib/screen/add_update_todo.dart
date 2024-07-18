import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Todo.dart';
import '../widget/appBarWidget.dart';

class AddUpdateTodoScreen extends StatefulWidget {
  final bool update;
  final Todo? todoToUpdate;
  final Function(Todo) onAdd;

  const AddUpdateTodoScreen(
      {super.key,
      required this.update,
      required this.todoToUpdate,
      required this.onAdd});

  @override
  createState() {
    return _AddUpdateTodoState();
  }
}

class _AddUpdateTodoState extends State<AddUpdateTodoScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.update) {
      _titleController.text = widget.todoToUpdate!.title;
    } else {
      _titleController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
              controller: _titleController,
              maxLines: 4,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  labelText: 'Task Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))))),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                _addUpdateTodo();
              },
              child: Text(
                widget.update ? 'Update' : 'Submit',
                style: TextStyle(),
              ))
        ],
      ),
    );
  }

  void _addUpdateTodo() {
    String title = _titleController.text.trim();
    if (title.isNotEmpty) {
      // Create a new Todo object
      Todo newTodo = Todo(
        userId: widget.update
            ? widget.todoToUpdate!.userId
            : DateTime.now().millisecondsSinceEpoch,
        id: widget.update
            ? widget.todoToUpdate!.id
            : DateTime.now().millisecondsSinceEpoch,
        title: title,
        completed: false, // Set default completed state
      );

      // Call the onAdd callback to add the new Todo
      widget.onAdd(newTodo);

      //Clear the title text
      _titleController.text = "";

      // pop back to screen
      Navigator.pop(context, newTodo);
    }
  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

// method to create AppBar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Center(child: Text('Todo List')),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
