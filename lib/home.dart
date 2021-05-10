import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'useful_widgets/bottomBar.dart';
import 'useful_widgets/txtInformation.dart';
import 'useful_widgets/btn.dart';

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
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 3,
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
                  TxtInformation("Name"),
                  SizedBox(
                    height: 20,
                  ),
                  TxtInformation("Surname"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 2,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 2,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                    child: TxtInformation("Mail")
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: 'bio',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Btn("Save",Colors.deepPurple),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Delete Account",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
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







