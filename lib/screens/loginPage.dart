import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';






class google_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width *0.8,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),
        onPressed: () {},
        color: Colors.white,
        child: Text("Login with Google",  textAlign: TextAlign.center,
          style: TextStyle(color: Colors.deepPurple, fontSize:18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
        child: Column(children: [
          Row(mainAxisAlignment:MainAxisAlignment.center,
              children:[
                SizedBox(height: size.height * 0.4,
                    width: size.width *0.5,child: Image(image:AssetImage('assets/knowy.jpg')))] ),
          Padding(
            padding: EdgeInsets.only(),
            child: textField("E-Mail",0.07,0.8,25,Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.03,),
            child: textField("Password",0.07,0.8,25,Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.03,),
            child: Btn("Login", Colors.deepPurple,0.07,0.8),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.03,),
            child: google_button(),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.03,),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){},
                    child: Text("Forgot my Password",
                      style: TextStyle(color: Colors.deepPurple, fontSize:15),)),

              ],),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: size.height*0.05,),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("New around here?",style: TextStyle(fontSize:15),),
                TextButton(onPressed: (){},
                    child: Text("Sign up",
                      style: TextStyle(color: Colors.deepPurple, fontSize:15),)),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

