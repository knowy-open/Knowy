import 'package:flutter/material.dart';
import 'package:new_project/bottom_sheet/forgetPasswordBottomSheet.dart';
import 'package:new_project/screens/SignUpPage.dart';
import 'package:new_project/screens/feedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/useful_widgets/textField.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();
String error = '';

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.1,
                    //child: Image(image: AssetImage('assets/images/knowy.jpg'))
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: textField(_emailController, "E-Mail", 0.07, 0.8, 25,
                      Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: textField(_passwordController, "Password", 0.07, 0.8,
                      25, Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          if (result == null) {
                            setState(() {
                              error = "geçersiz";
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedPage()));
                          }
                        }
                      },
                      color: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.03,
                  ),
                  child: google_button(),
                ),
                Text(
                  error,
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            forgetPassword(context);
                          },
                          child: Text(
                            "Forgot my Password",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 15),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New around here?",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 15),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class google_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {},
        color: Colors.white,
        child: Text(
          "Login with Google",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
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

