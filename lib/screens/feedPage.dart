import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/useful_widgets/questionCard.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/useful_widgets/bottomBar.dart';
import 'package:new_project/local_storage/test/dummyData_test.dart';
/*  
    Kodların aktarılması için iki çözüm söz konusu
    Provider ile çalışılabilir
    Kod bu sınıfta olabilir.
    Ama her türlü sınıfta parametlerle çalışmak problemli olacak aktarım aşamasında
    bloc kullanılabilir

    Kod Firebase'den çekilebilir.
*/

//Birinci deneme : Kodları buraya aktarma denemeleri.

DummyData dummyData = new DummyData();

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: MediaQuery.of(context).size.height * 0.07,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: QuestionCard(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
