import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/FeedPage.dart';
import 'package:new_project/services/database.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/bottomBar.dart';

final TextEditingController questionExplanation = new TextEditingController();
final TextEditingController option1 = new TextEditingController();
final TextEditingController option2 = new TextEditingController();
DateTime selectedDate = DateTime.now();

class CreateQuestionnaire extends StatefulWidget {
  @override
  State<CreateQuestionnaire> createState() => _CreateQuestionnaireState();
}

class _CreateQuestionnaireState extends State<CreateQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.1,
              right: size.width * 0.1,
              top: size.height * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    "Create Questionnaire",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Text(
                    "Question",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                controller: questionExplanation,
                autofocus: true,
                maxLines: 3,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.deepPurple)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Question Explanation",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.001, right: size.width * 0.001),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          DatabaseService().getQuestionnaires();
                          optionList.add(optionList.length);
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.deepPurple),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.001),
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.remove_rounded, color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
              Expanded(child: MyOptionWidget()),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  MyCheckbox(),
                  Text("Allow to multichoice"),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Text(
                    "Deadline",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.8,
                child: DatePickerDemo(),
              ),
              SizedBox(height: size.height * 0.02),
              Btn(
                "Create",
                Colors.deepPurple,
                0.07,
                0.8,
                function: () {
                  DatabaseService()
                      .createQuestionnaire(
                          questionExplanation.text,
                          {
                            "Option Explanation": option1.text,
                            "Value": 0.toString(),
                          },
                          selectedDate,
                          FirebaseAuth.instance.currentUser.uid,
                          args)
                      .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FeedPage())))
                      .catchError(
                          (onError) => print("Error: " + onError.toString()));
                },
              ),
//gurubun id'sini aktarma
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

List<int> optionList = <int>[0];

class MyOptionWidget extends StatefulWidget {
  @override
  State<MyOptionWidget> createState() => _MyOptionWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyOptionWidgetState extends State<MyOptionWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.01, top: size.height * 0.01),
                    child: TextField(
                      controller: option1,
                      autofocus: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: "Add another option",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_photo_alternate,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ));
              },
              childCount: 3,
              //childCount: optionList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: Colors.deepPurple,
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  /// Which holds the selected date
  /// Defaults to today's date.

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return TextField(
      controller: _controller,
      autofocus: true,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: "DD/MM/YYYY",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _selectDate(context);
            _controller.text = "${selectedDate.toLocal()}".split(' ')[0];
            _controller.value = _controller.value.copyWith(
              text: _controller.text,
              selection:
                  TextSelection.collapsed(offset: _controller.text.length),
            );
          },
          icon: Icon(
            Icons.calendar_today,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
