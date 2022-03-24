import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/useful_widgets/groupProfileBar.dart';
import 'package:new_project/useful_widgets/questionCard.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/useful_widgets/Btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:select_form_field/select_form_field.dart';

DummyData dummyData = new DummyData();

class GroupProfilePage extends StatefulWidget {
  @override
  _GroupProfilePageState createState() => _GroupProfilePageState();
}


class _GroupProfilePageState extends State<GroupProfilePage> {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ProfileView(),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: QuestionCard(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as DocumentSnapshot;
    Map<String, dynamic> data = args.data() as Map<String, dynamic>;
    
    data['Member List'].forEach((element) {
      
    });
    final List<Map<String, dynamic>> il = [];
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [GroupProfileBar()],
            ),
          ),

          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
            child: Row(children: [
              Text(
                data['Group Name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ]),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.07),
            child: Row(children: [
              Text(
                'Questionnaires',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              BtnAdd(1),
            ]),
          ),

          // questionCard(),
        ],
      ),
    );
  }
}
