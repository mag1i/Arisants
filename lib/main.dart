import 'package:flutter/material.dart';
import 'package:artisants/screens/wrapper.dart';
import 'package:artisants/services/auth.dart';
import 'package:artisants/Module/Useer.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<Useer>.value(
        value: AuthService().Uuu,
        child:MaterialApp(
      //  return MaterialApp(

          home:Wrapper(),
        ),

     );
  }
}

