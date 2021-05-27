import 'package:flutter/material.dart';
import 'package:group_profile/questionCard.dart';
import 'package:flutter/widgets.dart';
import 'Btn_Add.dart';
import 'bottomBar.dart';
import 'package:group_profile/ProfileBar.dart';



class groupProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.white,

        body:SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(
            children: [
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
