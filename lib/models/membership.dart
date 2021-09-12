
import 'package:new_project/models/group.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class MembershipKnowy{

 int trustPoint = 0;
 final GroupKnowy group;
 final UserKnowy user;

  MembershipKnowy(this.trustPoint, this.group, this.user);

  QuestionKnowy startQuestion(GroupKnowy group){
    
  }

  Option voteQuestion(QuestionKnowy){

  }

  Map<MembershipKnowy, int> voteTrustPoint(){

  } //MembershipList alacak Grouptan

  void leaveGroup(GroupKnowy group){
    user.membershipsList.remove(this);
    group.membersList.remove(this);
  }

  void editGroupProfile(GroupKnowy group, String name, String bio){
    group.name = name;
    if(group.bioValidator(bio)){
          group.bio = bio;
    }else{
      print("240 karakterden uzun olamaz!");
    }
  }

String toString() {
    // TODO: implement toString
    return "membership: " + user.toString() + trustPoint.toString();
  }

}