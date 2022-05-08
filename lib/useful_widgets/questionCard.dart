import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:intl/intl.dart';
import 'package:new_project/screens/question.dart';
import 'package:new_project/screens/resultPage.dart';
import 'package:new_project/services/database.dart';

List<String> soru = [
  "İNANAMIYORUM  falfksld kdvvvvvcdssssss vdssssss svfsvd oısgjofjgkfg skdjgksjgskgjso sosjosıgjosıg",
  "SONUNDA",
  "ÇALIŞTI!"
];
List<String> ad = [
  'bikem demirci bikem demirci bikem demirci',
  'Elif Nur Hançer',
  'Bahadır Akgün'
];
DatabaseService databaseService = new DatabaseService();
DummyData dummyData = new DummyData();

List<String> sonAd = [];

class QuestionCard extends StatefulWidget {
  @override
  QuestionState createState() => QuestionState();
}

class QuestionState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    dummyData.group.getAllQuestions().forEach((element) {
      sonAd.add(element.creator.user.name + " " + element.creator.user.surname);
    });
    ScrollController _scrollController = new ScrollController();

    return FutureBuilder(
        future: databaseService.getQuestionnaires(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.hasData == false) Future.delayed(Duration(seconds: 5));

          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }

          String currentElement = "";
          print("length is: " + snapshot.data.length.toString());
          return SingleChildScrollView(
              child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              currentElement = "" + snapshot.data.elementAt(index).toString();
              print(currentElement);
              return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("questionnaires")
                      .doc(currentElement)
                      .get(),
                  builder: (context,
                      AsyncSnapshot<DocumentSnapshot<Object>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LinearProgressIndicator();
                    }
                    Map<String, dynamic> data =
                        snapshot.data.data() as Map<String, dynamic>;
                    print("data is " + data.toString());
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.03,
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Colors.deepOrangeAccent,
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025),
                                        child: InkWell(
                                          onTap: () {}, //user profile
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.027,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.47,
                                            child: Text(
                                              sonAd[0],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.007),
                                        child: InkWell(
                                          onTap: () {}, //group profile
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.027,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.47,
                                            child: Text(
                                              dummyData.group.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                dummyData.group.questionsList[0]
                                                    .deadline
                                                    .difference(DateTime.now())
                                                    .inDays
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Gün kaldı',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ]),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green[200], width: 2.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01,
                              ),
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: FlatButton(
                                onPressed: () async {
                                  if (await databaseService
                                      .checkAlreadyAnswered(snapshot.data.id)) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ResultPage(),
                                            settings: RouteSettings(
                                                arguments: snapshot)));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Question(),
                                            settings: RouteSettings(
                                                arguments: snapshot)));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data['Question Explanation'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: Text(
                                new DateFormat("d MMMM").format(dummyData
                                    .group.questionsList[0].dateCreated)
                                /*dummyData.group.questionsList[0].dateCreated.day
                                          .toString() +
                                      " " +
                                      dummyData.group.questionsList[0].dateCreated.month
                                          .toString(),
                                          */
                                ,
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.yellow[200],
                                        radius: 15,
                                      )),
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.09,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.pinkAccent[200],
                                        radius: 15,
                                      )),
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.13,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.lightBlueAccent,
                                        radius: 15,
                                      )),
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.22,
                                      child: TextButton(
                                        child: Text(
                                          dummyData.group.questionsList[0]
                                                  .answers.length
                                                  .toString() +
                                              " answered",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ));
        });
  }
}
