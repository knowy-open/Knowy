import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project/QuestionPage/questionPage.dart';
import 'package:new_project/services/auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');
  final CollectionReference questionnaireCollection =
      FirebaseFirestore.instance.collection('questionnaires');

  Future<void> updateUserData(
      String name, String surname, String email, String password) async {
    return await userCollection.doc(uid).set({
      'Name': name,
      'Surname': surname,
      'Email': email,
      'Password': password,
      'Bio': '',
      'Group IDs': '',
    });
  }

  Future<void> createGroup(String name, String bio, String uid) async {
    return await groupCollection
        .add({
          'Group Name': name,
          'Group Description': bio,
          'Member List': [uid],
        })
        .then((value) async => await userCollection.doc(uid).update({
              "groups": FieldValue.arrayUnion([value.id])
            }))
        .catchError((error) => print("Failed to add group: $error"));
  }

  Future<void> createQuestionnaire(
      String questionExplanation,
      Map<String, String> options,
      DateTime deadline,
      String uid,
      String gid) async {
    return await questionnaireCollection.add({
      'Question Explanation': questionExplanation,
      'Deadline': deadline.toString(),
      'Creator': uid,
      'Group': gid,
    }).then((value) async {
      print("Question were added.");
      final CollectionReference optionCollection = FirebaseFirestore.instance
          .collection('questionnaires')
          .doc(value.id)
          .collection("options");
      await optionCollection.add(options);
    }).catchError((error) => print("Failed to add group: $error"));
  }

  Future<List<String>> getQuestionnaires() async {
    DocumentSnapshot<Object> currentUser =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    Map<String, dynamic> data = currentUser.data() as Map<String, dynamic>;
    var groups = data['groups'] as List<dynamic>;
    List<String> questions = [];
    groups.forEach((element) async {
      DocumentSnapshot<Object> currentGroup =
          await groupCollection.doc(element).get();
      Map<String, dynamic> groupData =
          currentGroup.data() as Map<String, dynamic>;
      groupData['questionsList'].forEach((element) {
        questions.add(element);
      });
    });
    return questions;
  }

  Future<String> getQuestionCreatorName(String id) async {
    DocumentSnapshot snapshot = await userCollection.doc(id).get();
    Map<String, dynamic> user = snapshot.data() as Map<String, dynamic>;
    String result = user["Name"] + " " + user["Surname"];
    return result;
  }
}
