import 'package:flutter/material.dart';

class textField extends StatelessWidget {
 final String textName;
 final Color textFieldBackgroundColor;
 final double textFieldHeight;
 final double textFieldWidth;
 final double borderRadius;

  const textField( this.textName, this.textFieldHeight, this.textFieldWidth, this.borderRadius,this.textFieldBackgroundColor) ;
 // height: 0.07  width: 0.8
 // borderRadius: 15.0 for bottom sheet , 25.0 for other text field


  @override
  Widget build(BuildContext context) {
    bool b;
    if(textName=='Password' || textName=='New Password'|| textName=='CurrentPassword' ){
      b=true;}
    else b=false;

    return SizedBox(height: MediaQuery.of(context).size.height*textFieldHeight, width: MediaQuery.of(context).size.width*textFieldWidth,
      child: TextField(
        obscureText: b,
        autofocus: true,
        maxLines: 1,
        decoration: InputDecoration( fillColor: textFieldBackgroundColor, filled: true,

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: textFieldBackgroundColor)
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textFieldBackgroundColor),

              borderRadius: BorderRadius.circular(borderRadius),

          ),
          hintText: textName,
          labelStyle: TextStyle(
            color: Colors.grey,

          ),


        ),),
    );
  }
}
