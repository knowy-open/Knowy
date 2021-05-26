import 'package:flutter/material.dart';
import 'package:group_profile/questionCard.dart';
import 'package:flutter/widgets.dart';
import 'Btn_Add.dart';
import 'bottomBar.dart';
import 'package:group_profile/ProfileBar.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
List<String> soru =["İNANAMIYORUM  falfksld kdvvvvvcdssssss vdssssss svfsvd oısgjofjgkfg skdjgksjgskgjso sosjosıgjosıg","SONUNDA","ÇALIŞTI!"];
List<String> ad =['bikem demirci bikem demirci bikem demirci','Elif Nur Hançer','Bahadır Akgün'];
class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.white,

        body:SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.07, ),
                child: CircleAvatar(backgroundColor: Colors.greenAccent, radius:MediaQuery.of(context).size.height * 0.07,),
              ),
              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.05),
                child: questionCard(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );


  }
}

