import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 35,
      fixedColor: Colors.purple,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: SizedBox(
            height: 0,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.purple,
          ),
          title: SizedBox(
            height: 0,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box,
            color: Colors.purple,
          ),
          title: SizedBox(
            height: 0,
          ),
        ),
      ],
    );
  }
}