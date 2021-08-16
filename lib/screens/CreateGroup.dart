import 'package:flutter/material.dart';
import '../services/database.dart';
import '../useful_widgets/btn.dart';
import '../useful_widgets/bottomBar.dart';
import 'feedPage.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupBioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1, top: size.height * 0.01),
        child: Form(
          key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text('Create Group', textAlign: TextAlign.left, style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text('Group Photo',
                style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15)
            ),
            SizedBox(height: size.height * 0.01),
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
                      icon: Icon(
                        Icons.add_photo_alternate,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            textField(_groupNameController, "Group Name", 0.07, 0.8, 25.0, Colors.white),
            SizedBox(height: size.height * 0.05),
            textField(_groupBioController, "Group Description", 0.07, 0.8, 25.0, Colors.white),
            SizedBox(height: size.height * 0.05),
            RaisedButton(
                  onPressed: () async {
                  if(_formKey.currentState.validate()){
                    await DatabaseService().createGroup(_groupNameController.text,_groupBioController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedPage()));
                    }
                  },
                  color: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Create",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
            //Btn("Create", Colors.deepPurple, 0.07, 0.8),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class textField extends StatelessWidget {
  final TextEditingController controllerName;
  final String textName;
  final Color textFieldBackgroundColor;
  final double textFieldHeight;
  final double textFieldWidth;
  final double borderRadius;

  textField(
    this.controllerName,
    this.textName,
    this.textFieldHeight,
    this.textFieldWidth,
    this.borderRadius,
    this.textFieldBackgroundColor,
  );
  // height: 0.07  width: 0.8
  // borderRadius: 15.0 for bottom sheet , 25.0 for other text field

  @override
  Widget build(BuildContext context) {
    bool b;
    if (textName == 'Password' ||
        textName == 'New Password' ||
        textName == 'CurrentPassword') {
      b = true;
    } else
      b = false;

    return SizedBox(
      height: MediaQuery.of(context).size.height * textFieldHeight,
      width: MediaQuery.of(context).size.width * textFieldWidth,
      child: TextField(
        controller: controllerName,
        obscureText: b,
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
          fillColor: textFieldBackgroundColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: textFieldBackgroundColor)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textFieldBackgroundColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          hintText: textName,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
