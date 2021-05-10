import 'package:flutter/material.dart';

class TxtInformation extends StatelessWidget{
 String txt;

 TxtInformation(this.txt);

  @override
  Widget build(BuildContext context) {
    return  TextField(
                    
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: txt,
                      
                    ),
                  );
  }
}
