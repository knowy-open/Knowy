import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';

enum SingingCharacter { lafayette, jefferson }

/// This is the stateful widget that the main application instantiates.
class AnswerRadio extends StatefulWidget {
  const AnswerRadio({Key key}) : super(key: key);

  @override
  State<AnswerRadio> createState() => _AnswerRadio();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AnswerRadio extends State<AnswerRadio> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.40,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ListView(
            children: <Widget>[
              RadioListTile<SingingCharacter>(
                title: const Text(''),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text("te"),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
                  RadioListTile<SingingCharacter>(
                title: const Text(''),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text("te"),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),    RadioListTile<SingingCharacter>(
                title: const Text(''),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text("te"),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
                  RadioListTile<SingingCharacter>(
                title: const Text(''),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text("te"),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnswerImages extends StatelessWidget {
  bool get isButtonPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.40,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          bool isButtonPressed = false;
          return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              ),
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              ),
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              ),
              RaisedButton(
                onPressed: () {},
                child: Container(
                    child: Image.network(
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsMrpBjxQX8uJCryNVI6Gvc_jPd6QtzDJF8C-p3RQmcu269bKd")),
              )
            ],
          );
        }));
  }
}
