import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/question.dart';

class MultipleChoice extends QuestionKnowy {
  int mid;
  DateTime dateCreated = DateTime.now();
  Map<Option, int> results = {};
  MultipleChoice(
      bool activeQuestion,
      MembershipKnowy creator,
      GroupKnowy group,
      DateTime deadline,
      List<Option> options,
      String questionMessage,
      Map<MembershipKnowy, Option> answers,
      Option result,
      this.mid)
      : super(activeQuestion, creator, group, deadline, options,
            questionMessage, answers, result);

  Map<String, Option> getUserKnowyId(Map<UserKnowy, Option> answersList) {
    Map<String, Option> answersWithId;
    answersList.forEach((key, value) {
      answersWithId[key.uid] = value;
    });
    return answersWithId;
  }

  Map<Option, int> calculateResult(GroupKnowy group) {
    answers.forEach((key, value) {
      if (results.containsKey(value)) {
        value.point += key.trustPoint;
        results.update(value, (value) {
          value += key.trustPoint;
          return value;
        });
      } else {
        value.point += key.trustPoint;
        results[value] = key.trustPoint;
      }
    });
    return results;
  }

  Option get result => super.result;

  String tooString() {
    // TODO: implement toString
    return "mid: " + mid.toString();
  }
}
