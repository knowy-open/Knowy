import 'package:flutter/material.dart';

class BtnAdd extends StatefulWidget {
  //BtnAdd(VoidCallback functionCall());

  @override
  _BtnAddState createState() => _BtnAddState();
}

class _BtnAddState extends State<BtnAdd> {
  //_BtnAddState(VoidCallback functionCall());
  
  //final void Function(int) callback = functionCall();
  @override
  Widget build(BuildContext context) {
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
        onPressed: () => {},
        icon: Icon(
          Icons.add,
          color: Colors.deepPurple,
          size: 20,
        ),
      ),
    );
  }
}

