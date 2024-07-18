import 'package:flutter/material.dart';
import 'package:flutter_dummy_app/screen/todo_list.dart';

/// The main function of the application
void main() {
  runApp(const MyApp());
}

/// This is the root widget of the application
/// MyApp is a StatelessWidget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
