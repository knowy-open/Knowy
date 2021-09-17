import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/question.dart';

class MultipleChoice extends QuestionKnowy {
  int mid;
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

    /*
    List<int> points = new List();
    this.options.forEach((element) {
      group.trustPointsList.forEach((key, value) {
        //Kod buradaki fonksiyonda null hatası veriyor. if'e giremedik. 
        Map<String, Option> answersWithId = getUserKnowyId(this.answers);
        if (answersWithId.containsKey(key.toString()) &&
            answersWithId[key].equals(element)) {
          element.point += value;
          points.add(element.point);
          print(points);
        }
      });
    });
    int count = 0;

    this.options.forEach((element) {
      points.add(element.point);
      print(element.point);
      if (points.reduce(max) > count) {
        count = points.reduce(max);
        _result = element;
      }
    });
    */
  }

  Option get result => super.result;

  String tooString() {
    // TODO: implement toString
    return "mid: " + mid.toString();
  }
}
