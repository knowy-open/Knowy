import 'package:flutter/material.dart';
import 'package:new_project/screens/CreateGroup.dart';
import 'package:new_project/screens/createQuestionnaire.dart';
import 'package:new_project/screens/feedPage.dart';

class BtnAdd extends StatelessWidget 
{
  BtnAdd(this.page);
  final int page;

  @override
  Widget build(BuildContext context) {
    var toPage;
    if(page == 0){
    toPage = CreateGroup();
    }else  if(page == 1){
    toPage = CreateQuestionnaire();
    }else{
      //toPage = addMember ?; 
    }
    Size size = MediaQuery.of(context).size;
    return Container(
      height:size.height * 0.05, width:size.width * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300],width:1),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: IconButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => toPage)),
        icon: Icon(
          Icons.add,
          color: Colors.deepPurple,
          size: 20,
        ),
      ),
    );
  }
}