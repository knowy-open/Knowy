import 'package:new_project/models/membership.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class GroupKnowy {
  final String gid;
  String name;
  String bio;
  String photo;
  List<MembershipKnowy> membersList;
  List<QuestionKnowy> questionsList;
  int minNumberOfVotesEvaluation;
  int maxTimeForVoting;
  //Map<int, int> trustPointsList; // UserKnowy, int = TrustPoints
  Map<MembershipKnowy, Map<MembershipKnowy, int>>
      trustPointsVotings; // int=Trust Point

  GroupKnowy(this.gid, this.name, this.membersList, this.trustPointsVotings);

  List<QuestionKnowy> getAllQuestions() {
    return questionsList;
  }

  List<MembershipKnowy> getAllUsers() {
    return membersList;
  }

  int setMaxTimeForVoting(int newMaxTime) {
    this.maxTimeForVoting = newMaxTime;
    return maxTimeForVoting;
  }

  int setMinNumberOfVotesForEvaluation(int minNumberOfVotesForEvaluation) {
    this.minNumberOfVotesEvaluation = minNumberOfVotesForEvaluation;
    return minNumberOfVotesEvaluation;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "group: " + gid + " " + name;
  }

  bool bioValidator(String bio) {
    if (bio.length > 240) {
      return false;
    }
    return true;
  }

  //Trust Point dağıtımı

}
