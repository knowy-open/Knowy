import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/Btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/trustVoteCard.dart';

class TrustVotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trust Vote Page',
      home: TrustVote(),
    );
  }
}

class TrustVote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextField(
                    onChanged: (String) {},
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300],
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      fillColor: Colors.grey[300],
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.deepPurple,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              BtnAdd(2),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0),
            alignment: Alignment.topRight,
            child: Text(
              ' Members',
            ),
          ),
          SizedBox(),
          Expanded(
             
             
                  child: ListView(
                    scrollDirection: Axis.vertical,
                children: [
                  VoteCard("Bahadır AKGÜN","sahip",),
                  VoteCard("Bikem DEMİRCİ","sahip"),
                  VoteCard("Elif Nur HANÇER","sahip"),
                  
                  Btn("Reset", Colors.deepPurple, 0.06,0.6),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Btn("Equalize", Colors.deepPurple, 0.06, 0.2),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Btn("Apply", Colors.deepPurple, 0.06, 0.2)


                ],
              ))
            
        ]),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

