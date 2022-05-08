import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => _State();
}

class _State extends State<ResultPage> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments
        as AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>;
    Map<String, dynamic> data = args.data.data() as Map<String, dynamic>;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(data["Question Explanation"]),
            SizedBox(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("questionnaires")
                      .doc(args.data.id)
                      .collection("options")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LinearProgressIndicator();
                    }
                    Map<dynamic, Color> colors = {};
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection.touchedSectionIndex;
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                final fontSize = 16.0;
                                final radius = 50.0;
                                Map<String, dynamic> option =
                                    document.data() as Map<String, dynamic>;
                                Color currentColor = Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt())
                                    .withOpacity(1.0);
                                colors[option["Question Explanation"]] =
                                    currentColor;
                                return PieChartSectionData(
                                  color: currentColor,
                                  value: option["value"].toDouble(),
                                  title: option["value"].toString(),
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              print("Colors are : " + colors.toString());
                              Map<String, dynamic> option =
                                  document.data() as Map<String, dynamic>;
                              return ListTile(
                                title: Text(option["Question Explanation"]),
                                tileColor:
                                    colors[option["Question Explanation"]],
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
