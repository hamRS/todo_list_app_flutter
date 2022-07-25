import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //create a getter and open a connection to database
  Future<Database> get database async {
    //this is the location of our database in device
    final dbpath = await getDatabasesPath();

    const dbName = 'todo.db';
    //joins the dbpath and dbname
    final path = join(dbpath, dbName);

    //open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  //the _createDB
  //this function creates tables in our database
  Future<void> _createDB(Database db, int version) async {
    //make sure the columns we create in our table math the todo_model field
    await db.execute('''
      CREATE TABLE todo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');
  }

  //Function that adds data into our database
  Future<void> insertTodo(Todo todo) async {
    //get the connection to adtabse
    final db = await database;
    await db.insert(
        'todo', //table name
        todo.toMap(), //the function in the todo model
        conflictAlgorithm:
            ConflictAlgorithm.replace); //replace duplicate values
  }

  //function that deletes a todo from the database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    // delete todo based on its id
    await db.delete('todo', //table
        where: 'id == ?', //condition
        whereArgs: [todo.id] // ? is replace by this list
        );
  }

  Future<List<Todo>> getTodo() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (index) => Todo(
          id: items[index]['id'],
          title: items[index]['title'],
          creationDate: DateTime.parse(items[index]['creationDate']),
          isChecked: items[index]['isChecked'] == 1 ? true : false),
    );
  }
}
