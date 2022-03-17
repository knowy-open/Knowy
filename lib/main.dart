import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/screens/CreateGroup.dart';
import 'package:new_project/screens/FeedPage.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/screens/question.dart';
import 'package:provider/provider.dart';
import 'screens/SignUpPage.dart';
import 'screens/loginPage.dart';

/*
void main() => runApp(MaterialApp(

  home: Profile(),

));
*/

void main() async {
  //DummyData dummyData = new DummyData();
  //dummyData.initializeValues();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: login(),
  ));
}
