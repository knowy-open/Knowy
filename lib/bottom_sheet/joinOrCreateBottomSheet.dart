import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';

joinOrCreate(context){
  showModalBottomSheet(
    context: context, isScrollControlled: true,
    builder: (context)=>SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Join Group",
                    style: TextStyle(fontSize: 18))
                ],),
            ),

            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [textField("Group Code",0.07,0.8,15,Colors.grey[200])],),
            ),

            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Btn("Find", Colors.deepPurple,0.07,0.8)],),
            ),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, bottom:MediaQuery.of(context).size.height*0.05,  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Btn(
                    "Create new Group", Colors.deepPurple,0.07,0.8)
                ],),
            )

          ],)
      )
    )
);
}






