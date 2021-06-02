import 'package:flutter/material.dart';

class ShowAnswerCount extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                                "10 Answered",
                                style: TextStyle(color: Colors.grey),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  );
  }

}