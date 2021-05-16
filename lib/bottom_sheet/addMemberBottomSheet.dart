import 'package:flutter/material.dart';
import 'btn.dart';
import 'textField.dart';
 class addMember extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [Text("Add Member",
                 style: TextStyle(fontSize: 18))
             ],),
         ),
         Padding(
           padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05 ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [textField("E-mail",0.07,0.8,15,Colors.grey[200])],),
         ),
         Padding(
           padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [Btn("Send Invitation", Colors.deepPurple,0.07,0.8)],),
         ),
         Padding(
           padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,bottom:MediaQuery.of(context).size.height*0.05, ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [shareButton()]),
         ),
       ],
     );
   }
 }

 class shareButton extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return SizedBox(height:MediaQuery.of(context).size.height*0.07,
       child: RaisedButton(onPressed: (){}, 
         color: Colors.deepPurple,
         padding: EdgeInsets.symmetric(horizontal: 50),
         elevation: 2,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(25)),
       child: Row(children: [
         Padding(
           padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.05 ),
           child: Icon(Icons.share,color: Colors.white,),
         ),

         Text("Share",style: TextStyle(color: Colors.white,fontSize: 14,) ,)
       ],) ,),
     );
   }
 }
 