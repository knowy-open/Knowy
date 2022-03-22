import 'package:flutter/material.dart';
import '../useful_widgets/textField.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/bottomBar.dart';

class GroupSettings extends StatefulWidget {
  @override
  _GroupSettingsState createState() => _GroupSettingsState();
}

class _GroupSettingsState extends State<GroupSettings> {
  String groupName;
  String description;
  final groupNameController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.02),
        child: ListView(children:[
            Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8.0)),
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.circular(8.0),
                          child: Image.network('https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',fit: BoxFit.fill, height: size.height * 0.2, width: size.height * 0.2),
                        ),
                        Positioned(
                          bottom: -2, right: -2,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_photo_alternate),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Edit Group Photo',
                    style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              textField("Group Name", 0.07, 0.8, 25.0, Colors.white),
              SizedBox(height: size.height * 0.01),
              textField("Group Description", 0.07, 0.8, 25.0, Colors.white),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.08, 0, 0, 0),
                    child: Text(
                      "Questionnaire Settings",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.08, 0, 0, 0),
                    child: Text(
                      "Maximum Time Interval",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                    child: Container(
                      width: size.width * 0.2,
                      child: Text(
                        "9h",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Slider1(),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.08, 0, 0, 0),
                    child: Text(
                      "Minimum Number of Votes",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                    child: Container(
                      width: size.width * 0.2,
                      child: Text(
                        "7 Votes",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            Slider2(),
            SizedBox(height: size.height * 0.01),
            Btn("Edit Trustpoints", Colors.deepPurple, 0.07, 0.8),
            SizedBox(height: size.height * 0.01),
            Btn("Save", Colors.deepPurple, 0.07, 0.8),
            SizedBox(height: size.height * 0.01),
            Btn("Leave Group", Colors.black, 0.07, 0.8),
          ],
        ),
        ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class Slider1 extends StatefulWidget{
  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1>{
  double _currentSliderValue = 12;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, 0, size.width * 0.08, 0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.deepPurple,
          inactiveTrackColor: Colors.deepPurple[100],
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 2.0,
          thumbColor: Colors.deepPurple,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: Colors.deepPurple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
        ),
        child: Slider(
          value: _currentSliderValue,
          min: 1,
          max: 24,
          divisions: 24,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ),
    );
  }
}

class Slider2 extends StatefulWidget{
  @override
  _Slider2State createState() => _Slider2State();
}

class _Slider2State extends State<Slider2>{
  double _currentSliderValue = 7;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, 0, size.width * 0.08, 0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.deepPurple,
          inactiveTrackColor: Colors.deepPurple[100],
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 2.0,
          thumbColor: Colors.deepPurple,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: Colors.deepPurple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
        ),
        child: Slider(
          value: _currentSliderValue,
          min: 3,
          max: 20,
          divisions: 18,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ),
    );
  }
}