import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/models/multipleChoice.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';
import '../dummyData.dart';

void main() {
  GroupKnowy group;
  GroupKnowy group1;
  MembershipKnowy membership;
  MembershipKnowy membership1;
  MembershipKnowy membership2;
  MembershipKnowy membership3;
  MembershipKnowy membership4;

  UserKnowy user = new UserKnowy("deneme@gmail.com", "bikem", "demirci", "bio",
      [membership], "pp", "password", "1");

  UserKnowy user1 = new UserKnowy("deneme1@gmail.com", "elif", "hancer", "bio",
      [membership1], "pp", "password", "2");

  UserKnowy user2 = new UserKnowy("deneme2@gmail.com", "bahadir", "akgun",
      "bio", [membership2], "pp", "password", "3");

  membership = new MembershipKnowy(0, group, user);
  membership1 = new MembershipKnowy(0, group, user1);
  membership2 = new MembershipKnowy(0, group, user2);
  membership3 = new MembershipKnowy(0, group1, user);
  membership4 = new MembershipKnowy(0, group1, user1);

  List<MembershipKnowy> membersList = [membership, membership1, membership2];
  List<MembershipKnowy> membersList1 = [membership3, membership4];

  Map<MembershipKnowy, Map<MembershipKnowy, int>> trustPointsVotings = {
    membership: ({membership: 0, membership1: 0, membership2: 0}),
    membership1: ({membership: 0, membership1: 0, membership2: 0}),
    membership2: ({membership: 0, membership1: 0, membership2: 0})
  };

  group = new GroupKnowy("1", "knowy", membersList, trustPointsVotings);
  // group1 = new GroupKnowy("2", "notKnowy", membersList1, this.trustPointsVotingList);

  List<UserKnowy> usersList = [user, user1, user2];

  Option option1 = Option(1, "soru 1 option 1", 1);
  Option option2 = Option(2, "soru 1 option 2", 1);

  List<Option> options1 = [option1, option2];

  Map<MembershipKnowy, Option> answers1 = {
    membership: option1,
    membership1: option2,
    membership2: option1
  };

  MultipleChoice question1 = new MultipleChoice(1, answers1, group, options1);

  print(usersList.toString());
  print(membersList.toString());
  print(group.toString());

  //print(user.membershipsList[0]);

  membership2.leaveGroup(group);
  print(membersList.toString());
  //print(user.membershipsList);

  membership.editGroupProfile(group, "name", "yeni bio");
  print(group.toString());

  user.editProfile("name", "surname", "bioo");
  print(usersList.toString());

  GroupKnowy group2 = user.createGroup("4", "acabaolcakmi");
  print(group2.membersList);
  MultipleChoice multipleChoice = membership1.startQuestion(
    [Option(2, "a", 5), Option(3, "inputdenem", 5)],
  );
  group.questionsList.add(multipleChoice);
  print(multipleChoice);
  print(group.getAllQuestions());
//Sorunun hangi gruba ait olduğu bilgisi eksik?
}
