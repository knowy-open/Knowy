import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';
forgetPassword(context){

  showModalBottomSheet(context: context, isScrollControlled: true,
      builder: (context)=>SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.1, ),
                child: Row(

                  children: [Text("Enter E-mail:",
                      style: TextStyle(fontSize: 18))
                  ],),
              ),
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [textField("E-mail",0.07,0.8,15,Colors.grey[200])],),
              ),
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, bottom:MediaQuery.of(context).size.height*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Btn("Send E-mail", Colors.deepPurple,0.07,0.8)],),
              ),
            ],),
        ),
      ));
}

