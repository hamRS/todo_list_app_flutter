import 'package:flutter/material.dart';

import './models/todo_model.dart';
import './models/db_model.dart';
import './screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //create dummy data
  var db = DatabaseConnect();
  await db.insertTodo(Todo(
      id: 1,
      title: 'Sample Title',
      creationDate: DateTime.now(),
      isChecked: true));
  print(await db.getTodo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
