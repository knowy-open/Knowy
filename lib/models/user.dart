import 'package:new_project/models/group.dart';
import 'package:new_project/models/membership.dart';

class UserKnowy {
  final String uid;
  String email;
  String name;
  String surname;
  String bio;
  String password;
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

  GroupKnowy createGroup(String gid, String name) {
    MembershipKnowy membershipKnowy = new MembershipKnowy(null, null, this);
    return GroupKnowy(gid, name, [membershipKnowy], {});
  }

  void joinGroup() {
    //
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
