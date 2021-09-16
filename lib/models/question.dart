import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/user.dart';

class QuestionKnowy {
  int qid;
  GroupKnowy group;
  String questionMessage;
  int answerCount = 0;
  Map<MembershipKnowy, Option> answers; //Option -> RadioButtonInputElement olabilir
  Option result;
  DateTime dateCreated;
  DateTime deadline;
  MembershipKnowy creator;
  bool activeQuestion;
  List<Option> options;

  QuestionKnowy(this.activeQuestion, this.creator, this.group, this.deadline,
      this.options, this.questionMessage, this.answers, this.result);

  QuestionKnowy createQuestion() {
    dateCreated = DateTime.now();
    return this;
  }

  //to see how many people answered.
  void answerQuestion() {
    this.answerCount++;
  }

  void calculateResult(GroupKnowy group) {
    /*
    List<int> points;
    this.options.forEach((element) {
      group.trustPointsList.forEach((key, value) {
        if (answers.containsKey(key) && answers[key] == element) {
          element.point += value;
        }
      });
    });
    int count = 0;

    this.options.forEach((element) {
      points.add(element.point);

      if (points.reduce(max) > count) {
        count = points.reduce(max);
        result = element;
      }
    });
    */
  }

  void addAnswer(UserKnowy userKnowy, QuestionKnowy question) {
    // answers.
  }

//incoming features
  /*
  void editQuestion(
      String questionMessage, List<Option> options, DateTime deadline) {
    //to check required answerCount
    //if ((group.getAllUsers().length / 2) > answerCount) {
    //  this.questionMessage = questionMessage;
     // this.deadline = deadline;
    }
  }
*/

  
}

