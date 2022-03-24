import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../useful_widgets/profileCards.dart';
import '../useful_widgets/bottomBar.dart';
import '../useful_widgets/Btn_Add.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class Member {
  String name;
  String surname;
  String bio;
  String photo;

  Member({this.name, this.surname, this.bio, this.photo});
}

class _MemberListState extends State<MemberList> {
  List<Member> members = [
    Member(
        name: 'name',
        surname: 'surname',
        bio: 'this is my bio',
        photo:
            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(
        name: 'name2',
        surname: 'surname2',
        bio: 'that is my bio',
        photo:
            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(
        name: 'name',
        surname: 'surname',
        bio: 'this is my bio',
        photo:
            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(
        name: 'name',
        surname: 'surname',
        bio: 'this is my bio',
        photo:
            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as List<dynamic>;
    

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.05,
                      child: TextField(
                        
                        onChanged: (String abc) {
                          
                        },
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[300],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          fillColor: Colors.grey[300],
                          filled: true,
                          prefixIcon:
                              Icon(Icons.search, color: Colors.deepPurple),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.clear,
                              color: Colors.deepPurple,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  BtnAdd(2),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  args.length.toString() + ' Members',
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: args.length,
                    itemBuilder: (context, index) {
                      CollectionReference users =
                          FirebaseFirestore.instance.collection('users');
    
                      return FutureBuilder<DocumentSnapshot>(
                        future: users.doc(args[index]).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
    
                          if (snapshot.hasData && !snapshot.data.exists) {
                            return Text("Document does not exist");
                          }
    
                          if (snapshot.connectionState == ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data.data() as Map<String, dynamic>;
                            return ProfileCards(
                              name: data['Name'],
                              surname: data['Surname'],
                              bio: 'abc',
                              photo: members[index].photo,
                            );
                          }
    
                          return Text("loading");
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
