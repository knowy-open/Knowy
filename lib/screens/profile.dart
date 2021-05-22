import 'package:flutter/material.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/profileBar.dart';
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
          ProfileBar(),
          SizedBox(height:0 ),
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

