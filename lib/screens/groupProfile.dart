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
List<String> ad =['bikem demirciiiiiiiiiiiiiib','falan','filan'];
class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.white,

        body:SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(
            children: [
              profileView(),
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

class  profileView extends StatelessWidget {
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