import 'package:flutter/material.dart';
import 'package:new_project/bottom_sheet/forgetPasswordBottomSheet.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/screens/SignUpPage.dart';
import 'package:new_project/screens/FeedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/useful_widgets/btn.dart';
import 'package:new_project/useful_widgets/textField.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

final FirebaseAuth _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();

String hata = '';

class _loginState extends State<login> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.1,
                    child: CircleAvatar())
              ]),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _emailController,
                      autofocus: true,
                      maxLines: 1,
                      decoration: textForm,
                    ),
                  )

                  /*textField(
                    _emailController, "E-Mail", 0.07, 0.8, 25, Colors.white),*/
                  ),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      autofocus: true,
                      maxLines: 1,
                      decoration: textForm.copyWith(hintText: "Password"),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                        if (result == 0) {
                          setState(() {
                            hata = 'Could not sign in with those credentials';
                            flag = true;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedPage()));
                        }
                      } catch (err) {
                        setState(() {
                          hata = 'Could not sign in with those credentials';
                          flag = true;
                        });
                        print(err);
                      }
                    },
                    style: buttonStyle,
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
              Container(
                color: flag ? Colors.red : Colors.white,
                child: Text(
                  hata,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
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
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 15),
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
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ],
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
