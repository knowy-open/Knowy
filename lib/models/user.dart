import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';

class UserKnowy {
  final String uid;
  String email;
  String name;
  String surname;
  String bio;
  String password;
  int questionCounter = 0;
  List<MembershipKnowy> membershipsList; //groupId ?
  String profilePicture;

  UserKnowy.withId(this.uid);

  UserKnowy(this.email, this.name, this.surname, this.bio, this.membershipsList,
      this.profilePicture, this.password, this.uid);

  bool login(String email, String password) {}

  bool logout(String uid) {}

  void editProfile(String name, String surname, String bio) {
    this.name = name;
    this.surname = surname;
    this.bio = bio;
  }

  void changePassword(String oldPassword, String password) {
    if (oldPassword == this.password) {
      //Verifying için tekrar bakabiliriz
      this.password = password;
    }
  }

  GroupKnowy createGroup(
    UserKnowy userKnowy,
    String gid,
    String name,
    int maxTimeForVoting,
    int minNumberOfVotesEvaluation,
  ) {
    // MembershipKnowy membershipKnowy = new MembershipKnowy(null, null, this);
    GroupKnowy groupKnowy = new GroupKnowy(
        gid, name, {}, maxTimeForVoting, minNumberOfVotesEvaluation);
    print(
        "                                                                                                  " +
            groupKnowy.name);
    MembershipKnowy membershipKnowy = joinGroup(groupKnowy, userKnowy);
    print(
        "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss " +
            membershipKnowy.toString());

    print(
        "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW" +
            this.toString() +
            "            " +
            this.membershipsList[0].toString());

    return groupKnowy;
  }

  MembershipKnowy joinGroup(GroupKnowy groupKnowy, UserKnowy userKnowy) {
    MembershipKnowy membershipKnowy =
        new MembershipKnowy(0, groupKnowy, userKnowy);
    userKnowy.membershipsList.add(membershipKnowy);
    print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" +
        userKnowy.membershipsList.toString());
    return membershipKnowy;
  }

  void deleteAccount(String uid, String password, String reason) {
    //
  }

  void editUserProfile(String name, String surname, String bio) {
    this.name = name;
    this.surname = surname;
    this.bio = bio;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: " + uid + name;
  }
}
