import 'package:flutter/material.dart';
import '../models/db_model.dart';
import '../widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  var db = DatabaseConnect();
  final Function insertFunction;
  final Function deleteFunction;

  TodoList({required this.insertFunction, required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data; //this is the data we have to show
          var datalength = data!.length;

          return datalength == 0
              ? Center(
                  child: Text('no Data found'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, index) => TodoCard(
                      id: data[index].id,
                      title: data[index].title,
                      creationDate: data[index].creationDate,
                      isChecked: data[index].isChecked,
                      insertFunction: insertFunction,
                      deleteFunction: deleteFunction),
                );
        },
      ),
    );
  }
}
