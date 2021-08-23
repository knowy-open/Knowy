import 'package:new_project/models/group.dart';
import 'package:new_project/models/user.dart';
import 'option.dart';

class QuestionKnowy {
  int qid;
  GroupKnowy group;
  String questionMessage;
  int answerCount = 0;
  Map<UserKnowy, Option> answers; //Option -> RadioButtonInputElement olabilir
  Option result;
  DateTime dateCreated;
  DateTime deadline;
  UserKnowy creator;
  bool activeQuestion;
  List<Option> options;
  QuestionKnowy(this.activeQuestion, this.creator, this.deadline, this.options,
      this.questionMessage, this.answers, this.result);

  QuestionKnowy createQuestion() {
    dateCreated = DateTime.now();
    return this;
  }

  //to see how many people answered.
  void answerQuestion() {
    this.answerCount++;
  }

  void calculateResult(QuestionKnowy question, GroupKnowy group) {
    question.options.forEach((element) {
      group.trustPointsList.forEach((key, value) {
        if (answers.containsKey(key) && answers[key] == element) {
          element.point += value;
        }
      });
    });
  }

  //question.answers.keys.contains(group.trustPointsList.keys(element))

  /*
    işaretlediği soruları bulmak lazım
    ilk userların işaretlediği optionları seçmek gerek.
    questiondan answerları çeker 
    answerda userknowy i group userknowy e eşlemesi gerekir.
    for each de tüm userknowy de (Option*trustpointi)
    */
}

void addAnswer(UserKnowy userKnowy, QuestionKnowy question) {
  // answers.
}


//incoming features
 /*
  void editQuestion(
      String questionMessage, List<Option> options, DateTime deadline) {
    //to check required answerCount
    //if ((group.getAllUsers().length / 2) > answerCount) {
    //  this.questionMessage = questionMessage;
     // this.deadline = deadline;
    }
  }

  void deleteQuestion(int qid){

  }

  
}
*/