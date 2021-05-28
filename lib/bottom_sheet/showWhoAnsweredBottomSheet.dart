import 'package:flutter/material.dart';
import 'package:login/MemberListPage.dart';

import 'ProfileCards.dart';

List <Member> members=[
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name2',surname: 'surname2', bio: 'that is my bio',photo:'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name2',surname: 'surname2', bio: 'that is my bio',photo:'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name2',surname: 'surname2', bio: 'that is my bio',photo:'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name2',surname: 'surname2', bio: 'that is my bio',photo:'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
  Member(name: 'name', surname: 'surname', bio: 'this is my bio', photo: 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
];

ScrollController _scrollController = new ScrollController();
showWhoAnswered(context){

  showModalBottomSheet(
      context: context, isScrollControlled: true,
      builder: (context)=>SafeArea(
        child: Container(
          constraints: BoxConstraints(
               maxHeight: MediaQuery.of(context).size.height*0.6,),



            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03,bottom: MediaQuery.of(context).viewInsets.bottom),
            child:SingleChildScrollView(

              child:ListView.builder( controller: _scrollController,
                scrollDirection:Axis.vertical,
                  shrinkWrap:true,
                itemCount: members.length,
                itemBuilder: (context, index){
                  return ProfileCards(
                    name: members[index].name,
                    surname: members[index].surname,
                    bio: members[index].bio,
                    photo: members[index].photo,
                  );
                }),
            ),
        ),
      )
  );
}

