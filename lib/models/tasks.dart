// create class model (data) to used in firebase.

class Tasks{
  static String collectionName = 'tasks'; // collection name in fire-store.

  // data (field) in fire-store.
  String? id;
  String? title;
  String? description;
  DateTime? date;
  bool? isDone;

  // create constructor with data that i want to fill it.

  Tasks({this.id ='',
    required this.title, required this.description,
    required this.date, this.isDone = false});

  // create another constructor to get data from JSON to data variables.

  Tasks.fromJson(Map<String, dynamic> data):this(
    id: data["id"] as String,
    title: data["title"] as String,
    date: DateTime.fromMillisecondsSinceEpoch(data["date"]),
    description: data["description"] as String,
    isDone: data["isDone"]
  );

  // method return map to send data to JSON (fire-store).
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'title': title,
      'description': description,
      'date': date?.millisecondsSinceEpoch,
      'isDone': isDone
    };
  }

}