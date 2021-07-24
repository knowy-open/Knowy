import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/screens/question.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProfileSettingsPage());
}

