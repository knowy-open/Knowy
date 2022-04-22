import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/models/multipleChoice.dart';
import 'package:intl/intl.dart';

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
final metin =
    'Magdeburg is the capital of Saxony-Anhalt state in Germany. It is a moderately sized city located halfway between Hannover and Berlin. The city is crossed by the river Elbe on which bank the OVG university has its main structures. One advantage in staying and studying in Magdeburg is the simple and favourable living cost. Public transportation in Magdeburg is very advanced and free of use for the students of the university. A popular bar mile for the students is the Hasselbachplatz.Magdeburg is the capital of Saxony-Anhalt state in Germany. It is a moderately sized city located halfway between Hannover and Berlin. The city is crossed by the river Elbe on which bank the OVG university has its main structures. One advantage in staying and studying in Magdeburg is the simple and favourable living cost. Public transportation in Magdeburg is very advanced and free of use for the students of the university. A popular bar mile for the students is the Hasselbachplatz.Magdeburg is the capital of Saxony-Anhalt state in Germany. It is a moderately sized city located halfway between Hannover and Berlin. The city is crossed by the river Elbe on which bank the OVG university has its main structures. One advantage in staying and studying in Magdeburg is the simple and favourable living cost. Public transportation in Magdeburg is very advanced and free of use for the students of the university. A popular bar mile for the students is the Hasselbachplatz.Magdeburg is the capital of Saxony-Anhalt state in Germany. It is a moderately sized city located halfway between Hannover and Berlin. The city is crossed by the river Elbe on which bank the OVG university has its main structures. One advantage in staying and studying in Magdeburg is the simple and favourable living cost. Public transportation in Magdeburg is very advanced and free of use for the students of the university. A popular bar mile for the students is the Hasselbachplatz.Magdeburg is the capital of Saxony-Anhalt state in Germany. It is a moderately sized city located halfway between Hannover and Berlin. The city is crossed by the river Elbe on which bank the OVG university has its main structures. One advantage in staying and studying in Magdeburg is the simple and favourable living cost. Public transportation in Magdeburg is very advanced and free of use for the students of the university. A popular bar mile for the students is the Hasselbachplatz.';
DummyData dummyData = new DummyData();
List<String> sonSoru = [];
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
      sonSoru.add(element.questionMessage);
      sonAd.add(element.creator.user.name + " " + element.creator.user.surname);
    });
    ScrollController _scrollController = new ScrollController();
    return SingleChildScrollView(
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: sonSoru.length,
        itemBuilder: (context, index) {
          return SizedBox(
            //bura değişebilir
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
                            left: MediaQuery.of(context).size.width * 0.03,
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepOrangeAccent,
                              radius: MediaQuery.of(context).size.width * 0.08,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.025),
                              child: InkWell(
                                onTap: () {}, //user profile
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.027,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  child: Text(
                                    sonAd[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.025,
                                  top: MediaQuery.of(context).size.height *
                                      0.007),
                              child: InkWell(
                                onTap: () {}, //group profile
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.027,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
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
                          left: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dummyData.group.questionsList[0].deadline
                                          .difference(DateTime.now())
                                          .inDays
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: ExpandablePanel(
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToCollapse: true,
                        ),
                        header: Text(metin,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis),
                        collapsed: null,
                        expanded: Text(metin),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      new DateFormat("d MMMM")
                          .format(dummyData.group.questionsList[0].dateCreated)
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
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Stack(
                      children: [
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.05,
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow[200],
                              radius: 15,
                            )),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.09,
                            child: CircleAvatar(
                              backgroundColor: Colors.pinkAccent[200],
                              radius: 15,
                            )),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.13,
                            child: CircleAvatar(
                              backgroundColor: Colors.lightBlueAccent,
                              radius: 15,
                            )),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.22,
                            child: TextButton(
                              child: Text(
                                dummyData.group.questionsList[0].answers.length
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
        },
      ),
    );
  }
}
