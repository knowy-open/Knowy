class UserKnowy {
  final String uid;
  String email;
  String name;
  String surname;
  String bio;
  String password;
  List<String> groupsList; //groupId ?
  String profilePicture;

  UserKnowy.withId({this.uid});

  UserKnowy(this.email, this.name, this.surname, this.bio, this.groupsList,
      this.profilePicture, this.password, this.uid);

  bool login(String email, String password) {}

  bool logout(String uid) {}

  void editProfile(
      String name, String surname, String bio, String profilePicture) {
    this.name = name;
    this.surname = surname;
    this.bio = bio;
    this.profilePicture = profilePicture;
  }

  void changePassword(String oldPassword, String password) {
    if (oldPassword == this.password) {
      //Verifying için tekrar bakabiliriz
      this.password = password;
    }
  }

  void createGroup() {
    //
  }

  void joinGroup() {
    //
  }

  void deleteAccount(String uid, String password, String reason) {
    //
  }
}
