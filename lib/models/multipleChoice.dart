import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/question.dart';

class MultipleChoice extends Question {
  Map<UserKnowy, Option> answers;
  Option _result;
  GroupKnowy group;
  List<Option> options;
  int mid;
  MultipleChoice(this.mid, this.answers, this.group, this.options);

  void calculateResult(GroupKnowy group) {
    List<int> points = new List();
    this.options.forEach((element) {
      group.trustPointsList.forEach((key, value) {
        //kod burdaki if bloğuna girmiyor. key value ların type ı eşleşmiyor.
        //if (answers.containsKey(key) && answers[key] == element) {
        element.point += value;

        //}
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
  }

  void saveAnswers() {}

  Option get result => _result;
}
