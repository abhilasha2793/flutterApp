import 'package:flutter/material.dart';
import 'package:flutter_dummy_app/screen/add_update_todo.dart';
import 'package:flutter_dummy_app/widget/todo_list_item.dart';
import 'package:shimmer/shimmer.dart';

import '../http/api_service.dart';
import '../models/Todo.dart';
import '../widget/app_bar_widget.dart';


/// This is a StatefulWidget class for displaying the list of todos
/// TodoListScreen is a StatefulWidget
/// _TodoListState is a state of TodoListScreen


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key, title});

  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoListScreen> {
  late Future<List<Todo>> _todoListFuture;
  final ApiService _todoService = ApiService();
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _todoListFuture = _todoService.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Todo List",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddUpdateTodoScreen(
                      onAdd: _addUpdateTodo,
                      update: false,
                      todoToUpdate: null,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Todo>>(
        future: _todoListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingShimmer();
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          } else if (snapshot.hasData) {
            _todos = snapshot.data!;
            return _buildTodoList(_todos);
          } else {
            return _buildErrorWidget('Unknown error');
          }
        },
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 10,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Something went wrong',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10.0),
      const Text(
        'Give it another try',
        style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
      ),
      const SizedBox(height: 10.0),
      ElevatedButton(
          onPressed: () {
            setState(() {
              _todoListFuture = _todoService.getTodos();
            });
          },
          child: const Text('Reload'))
    ]));
  }

  Widget _buildTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddUpdateTodoScreen(
                          onAdd: _addUpdateTodo,
                          update: true,
                          todoToUpdate: todo,
                        )),
              );
            },
            child: TodoListItem(task: todo));
      },
    );
  }

  void _addUpdateTodo(Todo newTodo) {
    late String message;
    setState(() {
      int index = _todos.indexWhere((item) => item.id == newTodo.id);
      if (index == -1) {
        _todos.insert(0, newTodo);
        message= 'Task has been added successfully !';
      } else {
        _todos[index] = newTodo;
        message = 'Task has been updated successfully !';
      }
    });
    _showSnackBar(message);

  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
