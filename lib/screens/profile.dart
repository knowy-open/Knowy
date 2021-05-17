import 'package:flutter/material.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/Btn_Add.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: statsBox(count: '142', title: 'Question'),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(''),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: statsBox(count: '7', title: 'Groups'),
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
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.5),
                  child: BtnAdd())
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

class But extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
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
