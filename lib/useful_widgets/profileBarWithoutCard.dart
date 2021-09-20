import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/screens/groupProfile.dart';
import 'package:new_project/screens/profile.dart';

DummyData dummyData = new DummyData();

class ProfileBarWithoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    print(dummyData.group.name);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.01),
              child: Column(
                children: [
                  CircleAvatar(
                    child: FittedBox(
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        child: Image.asset('lib/assets/bahadir.jpg')),
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
                        left: MediaQuery.of(context).size.height * 0.025),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      }, //user profile
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.027,
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: Text(
                          "a",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.025,
                        top: MediaQuery.of(context).size.height * 0.007),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupProfilePage()),
                        );
                      }, //group profile
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.027,
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: Text(
                          dummyData.group.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Gün kaldı',
                        style: TextStyle(fontSize: 10),
                      )
                    ]),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green[200], width: 2.0),
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
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Burda bir soru var ben index kullanmıyorum çünkü bende bir soru var liste gerek yok",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}
