import 'package:flutter/material.dart';

//Useful Widget for Lists of Profiles

class ProfileCards extends StatelessWidget {
  final String name;
  final String surname;
  final String bio;
  final String photo;

  const ProfileCards({Key key, this.name, this.surname, this.bio, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        title: Text(name + ' ' + surname),
        subtitle: Text(bio),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(photo),
        ),
      ),
    );
  }
}
