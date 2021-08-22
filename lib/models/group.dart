import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class GroupKnowy{

  final String gid;
  String name;
  String bio;
  String photo;
  List<UserKnowy> usersList;
  List<QuestionKnowy> questionsList;
  int minNumberOfVotesEvaluation;
  int maxTimeForVoting;
  Map<int, int> trustPointsList; // int = UserKnowy, int = TrustPoints

  GroupKnowy(this.gid);

  List<QuestionKnowy> getAllQuestions(){

    return questionsList;
  }

  List<UserKnowy> getAllUsers(){

    return usersList;
  }

  int setMaxTimeForVoting(int newMaxTime){
    this.maxTimeForVoting = newMaxTime;
    return maxTimeForVoting;
  }

  int setMinNumberOfVotesForEvaluation(int minNumberOfVotesForEvaluation){
    this.minNumberOfVotesEvaluation = minNumberOfVotesForEvaluation;
    return minNumberOfVotesEvaluation;
  }
  

}