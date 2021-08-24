import 'package:new_project/models/group.dart';
import 'package:new_project/models/multipleChoice.dart';
import 'package:new_project/models/option.dart';
import 'package:new_project/models/question.dart';
import 'package:new_project/models/user.dart';

class DummyData {
  final String src =
      "https://firebasestorage.googleapis.com/v0/b/knowy-3d052.appspot.com/o/knowy.png?alt=media&token=af03487c-04f7-45c6-8294-6b9c05fb043b";
  List<UserKnowy> _users = [
    UserKnowy(
        "bahadır@gmail.com",
        "bahadır",
        "akgün",
        "12345",
        groupsList,
        "https://firebasestorage.googleapis.com/v0/b/knowy-3d052.appspot.com/o/knowy.png?alt=media&token=af03487c-04f7-45c6-8294-6b9c05fb043b",
        "12345",
        "3"),
    UserKnowy(
        "elif@gmail.com",
        "elif nur",
        "hançer",
        "bio",
        groupsList,
        "https://firebasestorage.googleapis.com/v0/b/knowy-3d052.appspot.com/o/knowy.png?alt=media&token=af03487c-04f7-45c6-8294-6b9c05fb043b",
        "12345",
        "2"),
    UserKnowy(
        "bikem@gmail.com",
        "bikem",
        "demirci",
        "bio",
        groupsList,
        "https://firebasestorage.googleapis.com/v0/b/knowy-3d052.appspot.com/o/knowy.png?alt=media&token=af03487c-04f7-45c6-8294-6b9c05fb043b",
        "12345",
        "1")
  ];

  List<UserKnowy> get users => _users;

  set users(List<UserKnowy> users) {
    _users = users;
  }

  List<GroupKnowy> groups = [
    GroupKnowy("1", "flutter", _users),
    GroupKnowy("2", "falan", _users),
  ];

  List<MultipleChoice> questions = [
    MultipleChoice(),
    MultipleChoice(),
  ];

  List<Option> options = [
    Option(123, "option 1", 1),
    Option(234, "option 2", 1),
    Option(345, "oprion 1", 2),
    Option(456, "option 2", 2),
    Option(567, "option 3", 2),
    Option(678, "option 1", 3),
    Option(679, "option 2", 3),
    Option(671, "option 3", 3),
    Option(677, "option 4", 3),
  ];
}
