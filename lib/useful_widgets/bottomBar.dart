import 'package:flutter/material.dart';
import 'package:new_project/screens/CreateGroup.dart';
import 'package:new_project/screens/feedPage.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/screens/trusrVotePage.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (currentIndex) {
        if(currentIndex == 0){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );

        }else if(currentIndex == 1){
                  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedPage()),
        );
        }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateGroup()),
        );
        }

      },
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
