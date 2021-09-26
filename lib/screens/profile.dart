import 'package:flutter/material.dart';
import 'package:new_project/GroupProfilePage/view/widgets/ProfileCards.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
import 'package:new_project/models/membership.dart';
import 'package:new_project/screens/profile_settings.dart';
import 'package:new_project/useful_widgets/groupProfileBar.dart';
import 'package:new_project/useful_widgets/btn_Add.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/useful_widgets/profileBar.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: MainProfile(),
    );
  }
}

List<String> membershipList = [];

DummyData dummyData = new DummyData();

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  Future<DummyData> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(Duration(seconds: 3));
    return DummyData();
  }

  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    dummyData.user.membershipsList.forEach((element) {
      membershipList.add(element.group.bio);
    });
    return FutureProvider<DummyData>(
      initialData: DummyData(),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: Scaffold(
        body: Container(
          child: Column(children: <Widget>[
            ProfileBar(),
            SizedBox(height: 0),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(
                    dummyData.user.bio,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text("4 Groups",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30,
                            fontWeight: FontWeight.w300))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.5,
                            0,
                            MediaQuery.of(context).size.width * 0.05,
                            0),
                        child: BtnAdd()))
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: ListViewHome(),
            ))
          ]),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dummyData.initializeValues();
    print("QQQQQQQQQQQQQQQQQQQ" + dummyData.user.membershipsList[0].toString());
    return Expanded(
      child: Consumer<DummyData>(builder: (context, myModel, child) {
        myModel.initializeValues();
        return ListView.builder(
            itemCount: dummyData.user.membershipsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                //title: Text(
                // dummyData.user.membershipsList[index].group.name.toString()),
                subtitle: Text(
                    myModel.user.membershipsList[index].group.bio.toString()),
                leading: Image.asset("lib/assets/knowy.jpeg"),
              );
            });
      }),
    );
  }
}
