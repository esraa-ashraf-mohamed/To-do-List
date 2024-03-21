import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/tasks.dart';
import '../firebase_app.dart';

class AppProvider extends ChangeNotifier{
  List<Tasks> tasksList = [];
  var dateTime = DateTime.now();

  void getAllTasksFromFireStore() async{
    QuerySnapshot<Tasks> getAllTask = await AppFirebase.getCollection().get();
    tasksList = getAllTask.docs.map((doc){
      return doc.data();
    }).toList();

    /// filter data by date.
    tasksList = tasksList.where((task) {
      if(dateTime.day == task.date?.day &&
          dateTime.month == task.date?.month &&
          dateTime.year == task.date?.year )
      {
        return true;
      }
      return false;
    }).toList();

    /// sort tasks.
    tasksList.sort((task1, task2){
        return task1.date!.compareTo(task2.date!);
      },);
    notifyListeners();
  }

   void changeDate(DateTime newDateTime){
    dateTime = newDateTime ;
    getAllTasksFromFireStore();
  }
}