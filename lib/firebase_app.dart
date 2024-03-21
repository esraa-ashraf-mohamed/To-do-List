import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/models/tasks.dart';

class AppFirebase{

  /// 1- create collection and use manipulate a collection of (one-collection name).
  ///   1- create object from collection.
  ///   2- by function (withConverter) can read from fire-store
  ///     and up to fire-store.

  static CollectionReference<Tasks> getCollection(){
    return FirebaseFirestore.instance.collection(Tasks.collectionName).
    withConverter<Tasks>(
        fromFirestore: (snapshot, options) => Tasks.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
    );
  }

  /// 2- add tasks to fire-store by ID.
  ///   1- create object from collection ====> (getCollection method).
  ///   2- create document by (doc or add).
  ///     * (doc ==> create manual ID).
  ///     * (add ==>  unique auto-generated ID.).
  ///   3- sent to this function object from class model.
  ///   4- by (set) will replace all the document data with user's data.

  static Future<void> addTasksToFireStore(Tasks tasks){
    var tasksReference = getCollection();
    DocumentReference<Tasks> documentReference =tasksReference.doc();
     tasks.id = documentReference.id;
     return documentReference.set(tasks);
  }

  static Future<void> deleteTask(Tasks task){
    return getCollection().doc(task.id).delete();
  }

/// 3- to read data from fire-store: { there are 2 types }
///   first: one time read      ==> used it in this app
///   second: realtime changes.
///   ###########################
///   steps:
///     1. create object from collection ====> (getCollection method).
///     2. if i need read one document, call document's ID.    (if not goto step 3)
///     3. by (get) can read all documents.
///     4. convert   List<QueryDocumentSnapshot<Tasks>>    ====>   List<Task>   by (map).
///     5. setState(() {}); or notifyListeners(); in provider.
}