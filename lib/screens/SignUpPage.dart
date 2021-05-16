import 'package:flutter/material.dart';
import '../useful_widgets/textField.dart';
import '../useful_widgets/btn.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
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
                textField("E-Mail", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField("Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                textField("Password", 0.07, 0.8, 25.0, Colors.white),
                SizedBox(height: size.height * 0.05),
                Btn("Sign Up", Colors.deepPurple, 0.07, 0.8),
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
            )
        )
    );
  }
}

