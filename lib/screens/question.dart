import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/useful_widgets/ProfileCards.dart';
import 'package:new_project/useful_widgets/answerOptions.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';
import 'package:new_project/useful_widgets/profileBarWithoutCard.dart';
import 'package:new_project/useful_widgets/questionCard.dart';
import 'package:new_project/useful_widgets/answerCount.dart';
import 'package:new_project/useful_widgets/profileBarWithoutCard.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Question",
      home: Quest(),
    );
  }
}

class Quest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            IconButton(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.9),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            ProfileBarWithoutCard(),
            Expanded(child: getQuestionOptions(2))
          ],
        ),
        bottomNavigationBar: ShowAnswerCount());
  }
}

Widget getQuestionOptions(int questionType) {
  if (questionType == 1) {
    return Column(
      children: [AnswerRadio()],
    );
  }
  return Column(
    children: [AnswerImages()],
  );
}
