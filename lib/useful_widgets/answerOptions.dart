import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/GroupProfilePage/view/widgets/btn.dart';
import 'package:new_project/screens/resultPage.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';

/// This is the stateful widget that the main application instantiates.
class AnswerRadio extends StatefulWidget {
  final String questionId;

  AnswerRadio(this.questionId);

  @override
  State<AnswerRadio> createState() => _AnswerRadio(questionId);
}

/// This is the private State class that goes with MyStatefulWidget.
class _AnswerRadio extends State<AnswerRadio> {
  int groupValue = 1;
  String optionId = "";
  final String questionId;
  _AnswerRadio(this.questionId);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('questionnaires')
              .doc(questionId)
              .collection("options")
              .snapshots()
              .asBroadcastStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            }

            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> option =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(option["Question Explanation"]),
                        leading: Radio<int>(
                          value: option["id"],
                          groupValue: groupValue,
                          onChanged: (int value) {
                            setState(() {
                              groupValue = value;
                              optionId = document.id;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .runTransaction((transaction) {
                        FirebaseFirestore.instance
                            .collection("questionnaires")
                            .doc(questionId)
                            .update({
                          "answered": FieldValue.arrayUnion(
                              [FirebaseAuth.instance.currentUser.uid])
                        });

                        return FirebaseFirestore.instance
                            .collection("questionnaires")
                            .doc(questionId)
                            .collection("options")
                            .doc(snapshot.data.docs
                                .firstWhere((DocumentSnapshot element) =>
                                    element.get("id") == groupValue)
                                .id)
                            .update({"value": FieldValue.increment(1)});
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ResultPage(),
                              settings: RouteSettings(
                                  arguments: await FirebaseFirestore.instance
                                      .collection("questionnaires")
                                      .doc(questionId)
                                      .get())));
                    },
                    style: buttonStyle,
                    child: Text(
                      "Save and See Results",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class AnswerImages extends StatelessWidget {
  bool get isButtonPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.40,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          bool isButtonPressed = false;
          return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              ),
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              ),
            ],
          );
        }));
  }
}
