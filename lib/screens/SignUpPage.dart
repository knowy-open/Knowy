import 'package:flutter/material.dart';
import 'package:new_project/services/auth.dart';

import 'feedPage.dart';

class SignUp extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.05),
                textField(_nameController,"Name", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField(_surnameController, "Surname", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                /*TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),*/
                textField(_emailController, "E-Mail", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField(_passwordController, "Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField(_passwordAgainController, "Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),   
                RaisedButton(
                  onPressed: () async {
                  if(_formKey.currentState.validate()){
                    if(_passwordController.text == _passwordAgainController.text){
                      dynamic result = await _auth.registerWithEmailAndPassword(_nameController.text,_surnameController.text , _emailController.text, _passwordController.text);
                      if(result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          print(error);
                        });
                      }else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedPage()));
                          }
                    }else{
                      setState((){
                        error = 'Please enter the same Password.';
                        print(error);
                      });
                    }
                  }
                },
                  color: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                //Btn("Sign Up", Colors.deepPurple, 0.07, 0.8),
                SizedBox(height: size.height * 0.05),
                Text(
                  'You are completely safe.',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                TextButton(onPressed: (){},
                  child: Text(
                    'Read our Terms & Conditions.',
                    style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
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

