import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/question.dart';

class MultipleChoice extends Question {
  Map<MembershipKnowy, Option> answers;
  Option _result;
  GroupKnowy group;
  List<Option> options;
  int mid;

  MultipleChoice(this.mid, this.answers, this.group, this.options);

  Map<String, Option> getUserKnowyId(Map<UserKnowy, Option> answersList) {
    Map<String, Option> answersWithId;
    answersList.forEach((key, value) {
      answersWithId[key.uid] = value;
    });
    return answersWithId;
  }

  void calculateResult(GroupKnowy group) {
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

  void saveAnswers() {}

  Option get result => _result;
}
