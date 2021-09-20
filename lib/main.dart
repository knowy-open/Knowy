import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/CreateGroup.dart';
import 'package:new_project/screens/feedPage.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/screens/question.dart';

import 'screens/SignUpPage.dart';
import 'screens/loginPage.dart';

/*
void main() => runApp(MaterialApp(

  home: Profile(),

));
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

  home: GroupProfilePage(),

));
}

