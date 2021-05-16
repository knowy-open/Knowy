import 'package:flutter/material.dart';

class BtnAdd extends StatelessWidget {
  BtnAdd();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {},
      icon: Icon(
        Icons.add,
        color: Colors.deepPurple,
        size: 20,
      ),
    );
  }

}


