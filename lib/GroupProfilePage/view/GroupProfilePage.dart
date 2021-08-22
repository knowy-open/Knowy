import 'package:flutter/material.dart';
import 'widgets/profileBar.dart';
import 'widgets/questionCard.dart';
import 'widgets/btn_Add.dart';
import 'package:new_project/QuestionPage/questionPage.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';

/*
void main() => runApp(MaterialApp(
  home: MyApp(),
));
*/

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<String> soru =["İNANAMIYORUM  falfksld kdvvvvvcdssssss vdssssss svfsvd oısgjofjgkfg skdjgksjgskgjso sosjosıgjosıg","SONUNDA","ÇALIŞTI!"];
List<String> ad =['bikem demirciiiiiiiiiiiiiib','falan','filan'];

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.white,

        body:SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ProfileView(),
             Padding(
               padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.05),
               child: QuestionCard(),
             ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class  ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Column(
        children:[
          Padding(
            padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width * 0.05),
            child: Row( mainAxisAlignment:MainAxisAlignment.center,children: [ProfileBar()],),
          ),

          Padding(
            padding: EdgeInsets.only( left:MediaQuery.of(context).size.width * 0.07 ),
            child: Row(children:[
              Text(
                'Grup adı',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ]),
          ),

          Padding(
            padding: EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.03,left:MediaQuery.of(context).size.width * 0.07 ),
            child: Row(children:[
              Text(
                'Questionnaires',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only( left:MediaQuery.of(context).size.width * 0.3 ),
                child: BtnAdd(),
              ),
            ]),
          ),
          // questionCard(),
        ],),
    );
  }
}