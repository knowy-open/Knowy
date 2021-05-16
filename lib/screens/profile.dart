import 'package:flutter/material.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: MainProfile(),
    );
  }
}

class MainProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(40.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 0,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        statsBox(count: '142', title: 'Question'),
                        statsBox(count: '7', title: 'Groups'),
                      ],
                    ),
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
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
                                  'Edit Profile',
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
                          ))),
                ],
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(
                  "getInfos() Methodu Yazılacak Buraya\ngetBio()\nMail tabii ne işe yarayacaksa",
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
              IconButton(
                padding: EdgeInsets.fromLTRB(270, 0, 0, 0),
                icon: const Icon(Icons.add_box_outlined),
                color: Colors.deepPurple,
                onPressed: () {},
              ),
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
        Text(
          count,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    ),
  );
}

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
          title: Text('Grup1'),
          subtitle: Text('fr'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
          title: Text('Grup2'),
          subtitle: Text('gr'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
          title: Text('Grup3'),
          subtitle: Text('gr'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
          title: Text('Grup 4'),
          subtitle: Text('gr'),
        ),
      ],
    );
  }
}
