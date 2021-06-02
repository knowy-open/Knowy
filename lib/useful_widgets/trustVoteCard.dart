import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/btn.dart';

class VoteCard extends StatelessWidget {
  final String txtName;
  final String txtTitle;

  VoteCard(this.txtName, this.txtTitle);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Card(
                  child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListView(children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(""),
                        ),
                        title: Text(txtName),
                        subtitle: Text(txtTitle),
                      ),
                      VoteState(),
                    ]),
                  )
                ],
              ));
            },
          ),
        ),
      ],
    );
  }
}

class VoteState extends StatefulWidget {
  @override
  State<VoteState> createState() => VoteSlider();
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
