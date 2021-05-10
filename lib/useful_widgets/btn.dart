import 'package:flutter/material.dart';
class Btn extends StatelessWidget {
  final String buttonTxt;
  final Color foregroundColor;
 
  Btn(this.buttonTxt,this.foregroundColor);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
                      onPressed: () {},
                      color: foregroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        buttonTxt,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    );
  }
  
}