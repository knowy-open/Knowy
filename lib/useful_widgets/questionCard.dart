import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

//parametreler alır hale gelmesi lazım
//border rengi değişecek şekilde olmalı
class questionCard extends StatefulWidget {
  @override
  _questionState createState() => _questionState();
}

class _questionState extends State<questionCard> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return SingleChildScrollView(
      child: ListView.builder(
       controller: _scrollController,
        scrollDirection:Axis.vertical,shrinkWrap:true,itemCount: soru.length,itemBuilder: (context, index){
        return SizedBox( height:MediaQuery.of(context).size.height * 0.45, width: MediaQuery.of(context).size.width * 0.8,
          child: Card(margin: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01, horizontal: MediaQuery.of(context).size.height * 0.03,   ),
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.03, top:MediaQuery.of(context).size.height * 0.01  ),
                    child: Column(children: [ CircleAvatar(backgroundColor: Colors.deepOrangeAccent,radius: MediaQuery.of(context).size.width * 0.08,
                    )
                    ],),
                  ),
                  Padding(
                    padding: EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.01  ),
                    child: Column( children: [

                      Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height * 0.025  ),
                        child: InkWell(onTap: (){},//user profile
                          child: Container(height:MediaQuery.of(context).size.height * 0.027  , width:MediaQuery.of(context).size.width * 0.47  ,
                            child: Text(ad[index],maxLines: 1, overflow: TextOverflow.ellipsis,),
                          ),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height * 0.025 ,top:MediaQuery.of(context).size.height * 0.007  ),
                        child: InkWell(onTap: (){},//group profile
                          child: Container(height:MediaQuery.of(context).size.height * 0.027 , width:MediaQuery.of(context).size.width * 0.47  ,
                            child: Text('Grup adı olacakkgl fknhhrtjpo rtkgrpoklk kdgjhjhgfh',maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ),
                      )
                    ],),
                  ),

                  Padding(padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.02 , ),
                  child: Container(
                    child:Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Row(mainAxisAlignment:MainAxisAlignment.center, children: [Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),)]),
                      Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Gün kaldı', style: TextStyle( fontSize:10),)]),

                    ],) ,
                    decoration: BoxDecoration(
                      border:Border.all( color: Colors.green[200],width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    height:MediaQuery.of(context).size.height * 0.1, width:MediaQuery.of(context).size.width* 0.15,)
                  ,),






                ],),
                Container(
                  padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.02,horizontal:MediaQuery.of(context).size.width * 0.01,),
                  height:MediaQuery.of(context).size.height * 0.15 , width:MediaQuery.of(context).size.width * 0.9 ,
                  child: FlatButton(  onPressed: () {  },
                    child: Row(mainAxisAlignment:MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(
                        child: Text(soru[index],overflow: TextOverflow.ellipsis, maxLines:3,textAlign: TextAlign.left,
                        ),
                      )
                    ],),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,),
                  child: Text("17 Ocak ", style: TextStyle(color: Colors.grey), textAlign: TextAlign.start,),
                ),
                Container(height:MediaQuery.of(context).size.height * 0.1,width:MediaQuery.of(context).size.width * 0.8  ,
                  child: Stack(children: [
                    Positioned(top:MediaQuery.of(context).size.height * 0.05,left:MediaQuery.of(context).size.width * 0.05,child: CircleAvatar(backgroundColor: Colors.yellow[200],radius: 15,)),
                    Positioned(top:MediaQuery.of(context).size.height * 0.05,left:MediaQuery.of(context).size.width * 0.09,child: CircleAvatar(backgroundColor: Colors.pinkAccent[200], radius: 15,)),
                    Positioned(top:MediaQuery.of(context).size.height * 0.05,left:MediaQuery.of(context).size.width * 0.13,child: CircleAvatar(backgroundColor: Colors.lightBlueAccent, radius: 15,)),
                    Positioned(top:MediaQuery.of(context).size.height * 0.05,left:MediaQuery.of(context).size.width * 0.22,child: TextButton(child: Text("10 Answered", style: TextStyle(color: Colors.grey),), onPressed: (){},))
                  ],),
                )
              ],
            ),

          ),
        );

      },),
    );
  }
}