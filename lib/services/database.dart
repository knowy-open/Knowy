import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/QuestionPage/questionPage.dart';

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
      List<Map<String, dynamic>> _options,
      DateTime deadline,
      String uid,
      String gid) async {
    return await questionnaireCollection
        .add({
          'Question Explanation': questionExplanation,
          'Deadline': deadline.toString(),
          'Creator': uid,
          'Group': gid,
        })
        .then((value) async {
          print("Question were added.");
          for (Map<String, dynamic> option in _options) {
            final CollectionReference optionCollection = FirebaseFirestore
                .instance
                .collection('questionnaires')
                .doc(value.id)
                .collection("options");
            await optionCollection.add(option);
          }
          return value.id;
        })
        .then((value) => updateGroupQuestionnaires(gid, value))
        .catchError((error) => print("Failed to add group: $error"));
  }

  Future<List<dynamic>> getQuestionnaires() async {
// User
    List<dynamic> questionsList = [];
    DocumentSnapshot<Object> currentUser =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    var data = currentUser.data() as Map<dynamic, dynamic>;
    var groups = data['groups'] as List<dynamic>;

    for (var element in groups) {
      DocumentSnapshot<Object> currentGroup =
          await groupCollection.doc(element).get();
      var data = currentGroup.data() as Map<dynamic, dynamic>;
      List<dynamic> questions = data['questionsList'] as List<dynamic>;
      for (var question in questions) {
        questionsList.add(question);
      }
    }
    print("current questionsList length is:" + questionsList.length.toString());
    return questionsList;
    /* DocumentSnapshot<Object> currentUser = await userCollection.doc(uid).get();
    Map<String, dynamic> user = currentUser.data() as Map<String, dynamic>;
    questionnaireCollection.where("groups", isEqualTo: user["groups"]).get();*/
  }

  Future<void> updateGroupQuestionnaires(
    String gui,
    String qid,
  ) async {
    return await groupCollection
        .doc(gui)
        .update({
          'questionsList': FieldValue.arrayUnion([qid]),
        })
        .then((value) => print("question added"))
        .catchError(
            (error) => print("Failed to add question to group: $error"));
  }

  Future<bool> checkAlreadyAnswered(String questionId) async {
    DocumentSnapshot question =
        await questionnaireCollection.doc(questionId).get();
    Map<String, dynamic> data = question.data() as Map<String, dynamic>;
    for (var checker in data["answered"]) {
      if (checker == FirebaseAuth.instance.currentUser.uid) {
        return true;
      }
    }
    return false;
  }
}
