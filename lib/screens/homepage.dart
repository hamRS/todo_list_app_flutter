import 'package:flutter/material.dart';
import 'package:todo_app/models/db_model.dart';

import 'package:todo_app/widgets/user_input.dart';
import '../widgets/todo_list.dart';
import '../models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create functions here, where the widgets can comunicate
  //create a database object
  var db = DatabaseConnect();

  //to add a Todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Items",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            UserInput(
              insertFunction: addItem,
            ),
            TodoList(
              insertFunction: addItem,
              deleteFunction: deleteItem,
            ),
          ],
        ),
      ),
    );
  }
}
