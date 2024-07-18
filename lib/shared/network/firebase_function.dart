import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_codsoft/models/task_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance.collection("Tasks").withConverter(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, options) => task.toJson(),
        );
  }

  static Future<void> addTaskToFirestore(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTaskFromFirestore(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

 static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(String id,TaskModel task) {
    return getTasksCollection().doc(id).update(task.toJson());
  }
}
