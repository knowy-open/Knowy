import 'package:new_project/models/group.dart';
import 'package:new_project/models/multipleChoice.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'dart:math';
import 'package:new_project/models/user.dart';

class MembershipKnowy {
  int trustPoint = 0;
  final GroupKnowy group;
  final UserKnowy user;

  MembershipKnowy(this.trustPoint, this.group, this.user);

  MultipleChoice startQuestion(
      List<Option> options, DateTime deadline, String questionMessage) {
    MultipleChoice multipleChoice = new MultipleChoice(
        true, this, group, deadline, options, questionMessage, Map(), null, 5);
    return multipleChoice;
  }

  void voteQuestion(MembershipKnowy membership, MultipleChoice multipleChoice,
      Option option) {
    if (multipleChoice.options.contains(option)) {
      multipleChoice.answers[membership] = option;
    }
  }

  Map<MembershipKnowy, int> voteTrustPoint() {} //MembershipList alacak Grouptan

  void leaveGroup(GroupKnowy group) {
    user.membershipsList.remove(this);
    group.membersList.remove(this);
  }

  void editGroupProfile(GroupKnowy group, String name, String bio) {
    group.name = name;
    if (group.bioValidator(bio)) {
      group.bio = bio;
    } else {
      print("240 karakterden uzun olamaz!");
    }
  }

  void deleteQuestion(GroupKnowy group, MultipleChoice question) {
    if (identical(question.creator, this)) {
      group.getAllQuestions().remove(question);
    }
  }

  String toString() {
    // TODO: implement toString
    return "membership: " + user.toString() + trustPoint.toString();
  }
}
