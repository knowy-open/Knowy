
import 'package:flutter/material.dart';

class text_field extends StatelessWidget {
  final String text_name;


  const text_field(this.text_name) ;
  @override
  Widget build(BuildContext context) {
    bool b;
    TextEditingController _controller =TextEditingController();
    if(text_name=='Password'){
      b=true;

    }
    else b=false;
    return SizedBox(

      width: 300, height: 50,
      child: TextField(
        controller: _controller,
        obscureText: b,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.deepPurple)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.deepPurple)),
          hintText: text_name,
          labelStyle: TextStyle(
            color: Colors.grey,

          ),
        ),
      ),
    );
  }
}