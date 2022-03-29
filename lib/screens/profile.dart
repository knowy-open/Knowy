import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/GroupProfilePage/view/widgets/ProfileCards.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/screens/CreateGroup.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/Btn_Add.dart';
import 'package:new_project/useful_widgets/groupProfileBar.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/profileBar.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: MainProfile(),
    );
  }
}

List<String> membershipList = [];

DummyData dummyData = new DummyData();

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  Future<DummyData> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(Duration(seconds: 3));
    return DummyData();
  }

  /*
  1-  Firebase ile çalışmak
  2-  DummyData'ya bakılacak
  */

  @override
  Widget build(BuildContext context) {
    Function func() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateGroup()));
    }

    var auth = FirebaseAuth.instance;
    dummyData.initializeValues();

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
        future: users.doc(auth.currentUser.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return Scaffold(
            body: Container(
              child: Column(children: <Widget>[
                ProfileBar(),
                SizedBox(height: 0),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        data['Name'],
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
                        child: Text("${data['groups'].length} Groups",
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
                            child: new BtnAdd(0)))
                  ],
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        child: ListViewHome(data['groups'])))
              ]),
            ),
            bottomNavigationBar: BottomBar(),
          );
        });
  }
}

class ListViewHome extends StatelessWidget {
  final Stream<QuerySnapshot> _groupsStream =
      FirebaseFirestore.instance.collection('groups').snapshots();
  var list;
  ListViewHome(this.list);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _groupsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          return Expanded(
            child: /*ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          }).toList(),
        )*/

                ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      GroupProfilePage(),
                                  settings: RouteSettings(
                                      arguments: snapshot.data.docs.firstWhere(
                                          (element) =>
                                              element.id == list[index]))));
                        },
                        //title: Text(
                        // dummyData.user.membershipsList[index].group.name.toString()),
                        title: Text(snapshot.data.docs.firstWhere((element) =>
                            element.id == list[index])['Group Name']),
                        leading: Image.asset("lib/assets/knowy.jpeg"),
                      );
                    }),
          );
        });
  }
}
