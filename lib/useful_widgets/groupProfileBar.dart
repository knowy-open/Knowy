import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/models/group.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/FeedPage.dart';
import 'package:new_project/screens/MemberListPage.dart';
import 'package:new_project/screens/groupSettings.dart';
import 'package:new_project/screens/signUpPage.dart';
import 'package:new_project/screens/loginPage.dart';
import 'package:new_project/screens/profile_settings.dart';

DummyData dummyData = new DummyData();

class GroupProfileBar extends StatelessWidget {
  GroupProfileBar({GroupKnowy group});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as DocumentSnapshot;
    Map<String, dynamic> data = args.data() as Map<String, dynamic>;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: statsBox(
                count: '2', title: 'Questions'), // will be implemented.
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CircleAvatar(
                child: ClipOval(
                    child: Image.asset('lib/assets/knowy.jpeg',
                        fit: BoxFit.contain)),
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.width * 0.08,
              )),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MemberList(),
                        settings:
                            RouteSettings(arguments: data['Member List'])));
              },
              child: statsBox(
                  count: data['Member List'].length.toString(),
                  title: 'Members'),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.07),
              child: But())
        ],
      )
    ]);
  }
}

class But extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupSettings()),
          );
        },
        textColor: Colors.white,
        color: Colors.deepPurple,
        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                  child: Text(
                    'Profile Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            )));
  }
}

Widget statsBox({
  @required String count,
  @required String title,
}) {
  return Container(
    height: 98,
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Text(
              count,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        )
      ],
    ),
  );
}
