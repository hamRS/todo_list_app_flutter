import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class UserInput extends StatelessWidget {
  final Function insertFunction;

  UserInput({required this.insertFunction});
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: Color.fromARGB(204, 130, 171, 231),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'add new Item',
                border: InputBorder.none,
              ),
            ),
          )),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              var myTodo = Todo(
                  title: textController.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              insertFunction(myTodo);
            },
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
