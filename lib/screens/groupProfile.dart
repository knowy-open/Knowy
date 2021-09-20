import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/useful_widgets/profileBar.dart';
import 'package:new_project/useful_widgets/questionCard.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';


DummyData dummyData = new DummyData();

class GroupProfilePage extends StatefulWidget {
  @override
  _GroupProfilePageState createState() => _GroupProfilePageState();
}
List<String> soru =["İNANAMIYORUM  falfksld kdvvvvvcdssssss vdssssss svfsvd oısgjofjgkfg skdjgksjgskgjso sosjosıgjosıg","SONUNDA","ÇALIŞTI!"];
List<String> ad =['bikem demirciiiiiiiiiiiiiib','falan','filan'];
class _GroupProfilePageState extends State<GroupProfilePage> {



  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
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
                dummyData.group.name,
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