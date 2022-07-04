import 'package:flutter/material.dart';
import 'package:artisants/screens/home/Home.dart';
import 'package:artisants/screens/auth/authentification.dart';
import 'package:artisants/services/auth.dart';
import 'package:artisants/Module/Useer.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<Useer>(context);
    print(usr);

    
    //to return either home or auth widget
    if (usr == null) {
      return Authenticate();
    }
    else {
       return Home();
    }



  }
}
