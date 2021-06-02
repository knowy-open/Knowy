import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/useful_widgets/textfield.dart';
import '../useful_widgets/bottomBar.dart';
import '../useful_widgets/txtInformation.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/textfield.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    IconButton(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.9),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                 
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.5),
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
                  textField("Name", 0.07, 0.8, 25, Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  textField("Surname", 0.07, 0.8, 25, Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  textField("E-Mail", 0.07, 0.8, 25, Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  textField("Biography", 0.07, 0.8, 25, Colors.white),
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
                    child: Btn("Save", Colors.deepPurple, 0.07, 0.8),
                  ),
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
