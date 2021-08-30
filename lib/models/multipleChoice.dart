import 'dart:math';

import 'package:new_project/models/group.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/question.dart';

class MultipleChoice extends Question {
  Map<UserKnowy, Option> answers;
  Option _result;

  MultipleChoice(
    this.answers,
  ) {}

  void calculateResult(QuestionKnowy question, GroupKnowy group) {
    List<int> points;
    question.options.forEach((element) {
      group.trustPointsList.forEach((key, value) {
        if (answers.containsKey(key) && answers[key] == element) {
          element.point += value;
        }
      });
    });
    int count = 0;

    question.options.forEach((element) {
      points.add(element.point);

      if (points.reduce(max) > count) {
        count = points.reduce(max);
        _result = element;
      }
    });
  }

  void saveAnswers() {}

  Option get result => _result;
}
