import 'package:artisants/Module/UserInf.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final UserInf d;
  UserTile({ this.d });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[20],
            backgroundImage: AssetImage('assets/prsn.png'),
          ),
          title: Text(d.name),
          subtitle: Text('Takes ${d.age} age(s)'),
        ),
      ),
    );
  }
}