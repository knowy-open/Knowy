import 'package:flutter/material.dart';
import 'package:knowy/services/auth.dart';
import '../useful_widgets/textField.dart';
import '../useful_widgets/btn.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {

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
                textField("Name", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField("Surname", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                //textField("E-Mail", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                //textField("Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField("Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),   
                RaisedButton(
                  onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
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
