import 'package:flutter/material.dart';
import '../useful_widgets/ProfileCards.dart';
import '../useful_widgets/bottomBar.dart';
import '../useful_widgets/Btn_Add.dart';

class MemberList extends StatefulWidget{
  @override
  _MemberListState createState() => _MemberListState();
}

class Member{
  String name;
  String surname;
  String bio;
  String photo;

  Member({this.name, this.surname, this.bio, this.photo});
}

class _MemberListState extends State<MemberList>{

  List<Member> members = [
    Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(name: 'name2',surname: 'surname2', bio: 'that is my bio',photo:'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width:240,
                    height:30,
                    child:TextField(
                      onChanged: (String) {},
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300],),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        fillColor: Colors.grey[300], filled: true,
                        prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
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
                Container(
                  height:30, width:30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[300],width:1),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: BtnAdd(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left:20.0),
              alignment: Alignment.topLeft,
              child: Text(
                members.length.toString() + ' Members',
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index){
                    return ProfileCards(
                      name: members[index].name,
                      surname: members[index].surname,
                      bio: members[index].bio,
                      photo: members[index].photo,
                    );
                  }
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}