import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';

String optionsValue;
List deleteOptions =["o","bu","şu","fskdgl"];


deleteAccount(context){
  showModalBottomSheet(context: context, isScrollControlled: true,
      builder: (context)=>SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left:MediaQuery.of(context).size.width*0.05,  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Flexible(
                    child: Text("We are sorry to hear you want to delete your account.", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                  ],),
              ),
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Why are you deleting your account?",  textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18))
                  ],),
              ),
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ dropdownButtonDelete(),
                  ],),
              ),
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [textField("Password",0.07,0.8,15,Colors.grey[200]),
                  ],),
              ),
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, bottom:MediaQuery.of(context).size.height*0.05,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Btn("Delete Account",Colors.black,0.07,0.8),
                  ],),
              ),

            ],
          ),
        ),
      ));
}

class dropdownButtonDelete extends StatefulWidget {
  @override
  _dropdownButtonDeleteState createState() => _dropdownButtonDeleteState();
}

class _dropdownButtonDeleteState extends State<dropdownButtonDelete> {
  @override
  Widget build(BuildContext context) {
    return Container( height: MediaQuery.of(context).size.height*0.05, width: MediaQuery.of(context).size.width*0.8, //color: Colors.red,
      child: DropdownButton( focusColor: Colors.grey[200],
        hint: Text("Select"),
        dropdownColor: Colors.grey[200],
        isExpanded: true,
        value: optionsValue,
        onChanged: (value) {
        setState(() {
          optionsValue=value;
});
        },
        items: deleteOptions.map((value) {

          return DropdownMenuItem(
              value: value,
              child: Text(value));
        }).toList(),
      ),
    );
  }
}


