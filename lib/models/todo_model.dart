class Todo {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  //create constructor
  Todo(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

  //to save this data in adtabase we need to convert it to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  //for debugging
  @override
  String toString() {
    return 'Todo(id: $id , title: $title ,  creationDate: ${creationDate.toString()}, ischecked: $isChecked';
  }
}
