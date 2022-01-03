import 'package:new_project/models/membership.dart';
import 'package:new_project/models/multipleChoice.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class GroupKnowy {
  final String gid;
  String name;
  String bio = "artuğj çasdkı";
  String photo;
  List<MembershipKnowy> membersList = List.empty(growable: true);
  List<MultipleChoice> questionsList =
      List<MultipleChoice>.empty(growable: true);
  int minNumberOfVotesEvaluation;
  int maxTimeForVoting = 24;

  Map<MembershipKnowy, int> trustPointsList =
      {}; // UserKnowy, int = TrustPoints
  Map<MembershipKnowy, Map<MembershipKnowy, int>>
      trustPointsVotings; // int=Trust Point

  GroupKnowy(this.gid, this.name, this.trustPointsVotings,
      this.maxTimeForVoting, this.minNumberOfVotesEvaluation,
      [this.membersList]);

  //required for initialize.
  Map<MembershipKnowy, int> getAllTrustPoints() {
    //membersList.forEach((element) {
    // trustPointsList[element] = 0;
    //});
    return trustPointsList;
  }

  List<MultipleChoice> getAllQuestions() {
    return questionsList;
  }

  List<MembershipKnowy> getAllMembers() {
    return membersList;
  }

  int setMaxTimeForVoting(int newMaxTime) {
    this.maxTimeForVoting = newMaxTime;
    return maxTimeForVoting;
  }

  int setMinNumberOfVotesForEvaluation(int minNumberOfVotesForEvaluation) {
    if (membersList.length <= 3) {
      this.minNumberOfVotesEvaluation = membersList.length;
    } else {
      this.minNumberOfVotesEvaluation = minNumberOfVotesForEvaluation;
    }
    return minNumberOfVotesEvaluation;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "group: " +
        gid +
        " " +
        name +
        " " +
        maxTimeForVoting.toString() +
        " " +
        minNumberOfVotesEvaluation.toString();
  }

  bool bioValidator(String bio) {
    if (bio.length > 240) {
      return false;
    }
    return true;
  }

  //Trust Point dağıtımı

}
