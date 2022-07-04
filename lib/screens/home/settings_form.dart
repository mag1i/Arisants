import 'package:artisants/Module/Useer.dart';
import 'package:artisants/Module/UserInf.dart';
import 'package:artisants/services/Db.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
 /* final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];*/

  // form values
  String _currentName;
  String _currentLn='k';
  int _currentAge;

  @override
  Widget build(BuildContext context) {

    Useer user = Provider.of<Useer>(context);

    return StreamBuilder<UserData>(
      stream: Db(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration:  InputDecoration(
                   // hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val )),

                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  value: _currentLn ?? userData.ln,
                  decoration:  InputDecoration(
                    hintText: 'idk',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0),
                    ),
                  ),
                /*  items: sugars.map((ln) {
                    return DropdownMenuItem(
                      value: ln,
                      child: Text('$ln sugars'),
                    );
                  }).toList(),*/
                  onChanged: (val) => setState(() => _currentLn = val ),
                ),
                SizedBox(height: 10.0),
               /* Slider(
                  value: (_currentAge ?? userData.age).toDouble(),
                  activeColor: Colors.brown[_currentAge ?? userData.age],
                  inactiveColor: Colors.brown[_currentAge ?? userData.age],
                 /* min: 100.0,
                  max: 900.0,
                  divisions: 8,*/
                  onChanged: (val) => setState(() => _currentAge = val.round()),

                ),*/
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await Db(uid: user.uid).UserUpdateData(
                          _currentLn ?? snapshot.data.ln,
                        _currentName ?? snapshot.data.name,
                          _currentAge ?? snapshot.data.age
                      );
                      Navigator.pop(context);
                    }
                  }
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      }
    );
  }
}
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}