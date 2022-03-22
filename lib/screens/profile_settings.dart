import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/services/auth.dart';
import 'package:new_project/useful_widgets/textfield.dart';
import '../useful_widgets/bottomBar.dart';
import '../useful_widgets/txtInformation.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Profile Settings",
        theme: ThemeData.light(),
        home: ProfileSettings());
  }
}

class ProfileSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Settings();
}

class Settings extends State<ProfileSettings> {
  String name;
  String surname;
  String bio;
  String eMail;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final eMailController = TextEditingController();
  final bioController = TextEditingController();

  final AuthService _auth = AuthService();
  var auth = FirebaseAuth.instance;
  String documentId;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {},
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(''),
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Edit Profile Photo",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.person),
                        hintText: 'Name',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: nameController,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.person),
                        hintText: 'Surname',
                        labelText: 'Surname',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: surnameController,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.mail),
                        hintText: 'E-Mail',
                        labelText: 'E-Mail',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: eMailController,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.person_pin_circle),
                        hintText: 'Biography',
                        labelText: 'Biography',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      controller: bioController,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change Password",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.deepPurple),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          bio = bioController.text.toString();
                          name = nameController.text.toString();
                          surname = surnameController.text.toString();

                          users
                              .doc(auth.currentUser.uid)
                              .update({"bio": "$bio"});
                          users
                              .doc(auth.currentUser.uid)
                              .update({"Name": "$name"});
                          users
                              .doc(auth.currentUser.uid)
                              .update({"Surname": "$surname"});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        style: buttonStyle,
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Btn("Logout", Colors.black, 0.07, 0.8),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Btn("Delete Account", Colors.black, 0.07, 0.8),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
