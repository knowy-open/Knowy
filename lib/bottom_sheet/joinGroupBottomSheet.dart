import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';



class joinGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top:MediaQuery.of(context).size.height*0.05,
            left:MediaQuery.of(context).size.width*0.05, ),
          child: Row( children: [
            Column(
              children: [
                CircleAvatar(backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.height*0.06,
                ),
              ],
            ),


            Column(
              children: [
                Row(
                  children: [
                    QMNumbers("12","Questions","17","Members"),
                  ],
                ),
                Row(children: [
                  Container( decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                    height:MediaQuery.of(context).size.height*0.05, width:MediaQuery.of(context).size.width*0.7 ,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("INF[X]",
                          style: TextStyle(color: Colors.black),
                        )
                    ),
                  ),

                ],)
              ],
            ),

          ],),
        ),

        //


        Padding(
          padding: EdgeInsets.only(
            top:MediaQuery.of(context).size.height*0.05,
            left:MediaQuery.of(context).size.width*0.07,
            right:MediaQuery.of(context).size.width*0.05,
          ),
          child: Row(
            children: [
              Container( padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02, ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height:MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width*0.88,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("gfgbf fksflksoldksoksp vğpğdğp dovkslkvcölsşcömsdmfkcmdsl",
                        style: TextStyle(
                            fontSize: 18)
                    )
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05 ),
          child: Btn("Join Group", Colors.deepPurple,0.07,0.8),
        ),


      ],);
  }
}

class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
final paint =Paint()..color=Colors.pink..strokeWidth=100;

canvas.drawLine(

    Offset(size.width*0.6, size.height*0.1),
    Offset(size.width*0.1, size.height*0.5 ),
     paint,

    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true ;
  }



class QMNumbers extends StatelessWidget {
  final String first_variable_number;
  final String first_variable_name;
  final String second_variable_number;
  final String second_variable_name;

  const QMNumbers( this.first_variable_number, this.first_variable_name, this.second_variable_number, this.second_variable_name);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height*0.05,width: MediaQuery.of(context).size.width*0.7,

      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(first_variable_number,textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
              Text(first_variable_name, textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[500],
                  )
              )
            ],),
          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(second_variable_number,textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                ),
                Text(second_variable_name, textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[500],
                    )
                )],

            ),
          ),
        ],),
    );
  }
}
