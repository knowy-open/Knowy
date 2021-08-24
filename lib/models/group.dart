import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class GroupKnowy {
  final String gid;
  final String name;
  String bio;
  String photo;
  final List<UserKnowy> usersList;
  List<QuestionKnowy> questionsList;
  int minNumberOfVotesEvaluation;
  int maxTimeForVoting;
  Map<int, int> trustPointsList; // int = UserKnowy, int = TrustPoints
  Map<UserKnowy, Map<UserKnowy, int>> trustPointsVotingList; // int=Trust Point

  GroupKnowy(this.gid, this.name, this.usersList);

  List<QuestionKnowy> getAllQuestions() {
    return questionsList;
  }

  List<UserKnowy> getAllUsers() {
    return usersList;
  }

  int setMaxTimeForVoting(int newMaxTime) {
    this.maxTimeForVoting = newMaxTime;
    return maxTimeForVoting;
  }

  int setMinNumberOfVotesForEvaluation(int minNumberOfVotesForEvaluation) {
    this.minNumberOfVotesEvaluation = minNumberOfVotesForEvaluation;
    return minNumberOfVotesEvaluation;
  }
}
