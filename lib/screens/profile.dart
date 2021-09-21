import 'package:flutter/material.dart';
import 'package:new_project/GroupProfilePage/view/widgets/ProfileCards.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/groupProfileBar.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/profileBar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: MainProfile(),
    );
  }
}

DummyData dummyData = new DummyData();

class MainProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          ProfileBar(),
          SizedBox(height:0 ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(
                  dummyData.user.bio,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text("4 Groups",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 30,
                          fontWeight: FontWeight.w300))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.5,
                          0,
                          MediaQuery.of(context).size.width * 0.05,
                          0),
                      child: BtnAdd()))
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: ListViewHome(),
          ))
        ]),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    return Expanded(
              child: ListView.builder(
                  itemCount: dummyData.user.membershipsList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(dummyData.user.membershipsList[index].group.name),
                      subtitle: Text(dummyData.user.membershipsList[index].group.bio),
                      leading: Image.asset("lib/assets/knowy.jpeg"),
                    );
                  }
              ),
            );
  }
}

