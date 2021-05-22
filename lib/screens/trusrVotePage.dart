import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/Btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';

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
      body: SafeArea(child:Column(children: <Widget>[
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
            BtnAdd(),
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: 20.0),
          alignment: Alignment.topRight,
          child: Text(
            ' Members',
          ),
        ),
        SizedBox(width: 200, height: 100,),
         Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: VoteCard(),
          ))
      ]),),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class VoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: ListView(children:<Widget> [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(''),
            ),
            title: Text('Grup1'),
            subtitle: Text('fr'),
           
          ),
         
        ]));
  }
}

class VoteState extends StatefulWidget {
  @override
  State<VoteState> createState() {
    VoteSlider();
  }
}

class VoteSlider extends State<VoteState> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
