import 'package:flutter/material.dart';
import '../useful_widgets/textField.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/bottomBar.dart';

class CreateGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text('Create Group', textAlign: TextAlign.left, style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 30),
            Text('Group Photo',
                style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15)
            ),
            SizedBox(height:10),
            Container(
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8.0)),
              height: 100,
              width: 100,
              child: Stack(
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(8.0),
                    child: Image.network('https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',fit: BoxFit.fill, height: 100, width: 100),
                  ),
                  Positioned(
                    bottom: -2, right: -2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_photo_alternate,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            textField("Group Name", 0.07, 0.8, 25.0, Colors.white),
            SizedBox(height: 20),
            textField("Group Description", 0.07, 0.8, 25.0, Colors.white),
            SizedBox(height: 30),
            Btn("Create", Colors.deepPurple, 0.07, 0.8),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}