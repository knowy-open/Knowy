import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/GroupProfilePage/view/widgets/btn.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/services/database.dart';
import 'package:new_project/useful_widgets/ProfileCards.dart';
import 'package:new_project/useful_widgets/answerOptions.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';
import 'package:new_project/useful_widgets/profileBarWithoutCard.dart';
import 'package:new_project/useful_widgets/questionCard.dart';
import 'package:new_project/useful_widgets/answerCount.dart';
import 'package:new_project/useful_widgets/profileBarWithoutCard.dart';

class Question extends StatefulWidget {
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments
        as AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>;
    Map<String, dynamic> data = args.data.data() as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              IconButton(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.9),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              ProfileBarWithoutCard(data),
              Expanded(
                  child: Column(
                children: [
                  AnswerRadio(args.data.id),
                ],
              )),
            ],
          ),
          bottomNavigationBar: ShowAnswerCount()),
    );
  }
}
