import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/task_model.dart';
import '../../../model/user_model.dart';

class FireBaseFunction {
  static CollectionReference<TaskModel> getTaskToCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, options) => task.toJson(),
        );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.COLLECTION_NAME)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, options) {
            return user.toJson();
          },
        );
  }

  static Future<void> addTaskToFirestore(TaskModel task) {
    var collection = getTaskToCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTaskFirestore(DateTime date) {
    var collection = getTaskToCollection();
    return collection
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> delete(String id) {
    return getTaskToCollection().doc(id).delete();
  }

  static Future<void> update(String id, TaskModel task) {
    return getTaskToCollection().doc(id).update(task.toJson());
  }

  static void addUserToFirestore(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    docRef.set(user);
  }

  static void creatrAccount(
      String name, int age, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
          id: credential.user!.uid, name: name, age: age, email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e.message);
      } else if (e.code == 'email-already-in-use') {
        print(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void login(String email, String password, Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError(e.message);
      } else if (e.code == 'wrong-password') {
        onError(e.message);
      }
    }
  }
}
