import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  TodoCard({
    required this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
    required this.insertFunction, //will handle  the changes in checkbox
    required this.deleteFunction, // will handle the delete button
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
      id: widget.id,
      title: widget.title,
      creationDate: widget.creationDate,
      isChecked: widget.isChecked,
    );
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.creationDate.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 134, 133, 133),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteFunction(anotherTodo);
              },
              icon: Icon(Icons.close))
        ],
      ),
    );
  }
}
