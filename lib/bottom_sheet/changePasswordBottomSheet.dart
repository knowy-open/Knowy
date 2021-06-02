import 'package:flutter/material.dart';

import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';
changePassword(context){
  showModalBottomSheet(
      context: context, isScrollControlled: true,
      builder: (context)=>SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.1, ),
                  child: Row(

                    children: [Text("Current Password:",
                        style: TextStyle(fontSize: 18))
                    ],),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [textField("Current Password",0.07,0.8,15,Colors.grey[200])],),
                ),
                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.1, ),
                  child: Row(

                    children: [Text("New Password:",
                        style: TextStyle(fontSize: 18))
                    ],),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [textField("New Password",0.07,0.8,15,Colors.grey[200])],),
                ),
                Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.1, ),
                  child: Row(

                    children: [Text("Verify New Password:",
                        style: TextStyle(fontSize: 18))
                    ],),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [textField("New Password",0.07,0.8,15,Colors.grey[200])],),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, bottom:MediaQuery.of(context).size.height*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Btn("Change", Colors.deepPurple,0.07,0.8)],),
                ),

              ],),
          ),
        ),
      )
  );
}
