import 'package:flutter/material.dart';
import 'package:artisants/services/auth.dart';
import 'package:artisants/services/Db.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:artisants/Module/UserInf.dart';
import 'package:artisants/screens/home/Data.dart';
import 'package:artisants/screens/home/settings_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

      return StreamProvider<List<UserInf>>.value(
        value:Db().dt,
        child: Container(
          child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Artisants'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.settings),
                  label: Text('settings'),
                  onPressed: () => _showSettingsPanel(),
                )
              ],
            ),
            body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/g.jpg'),
            fit: BoxFit.cover,
            ),
            ),
            child: Dt()
            ),
            ),
            ),
      );
  }
}