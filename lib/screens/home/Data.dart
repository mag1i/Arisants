import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:artisants/Module/UserInf.dart';
import 'package:artisants/screens/home/UserDataTile.dart';


class Dt extends StatefulWidget {
  @override
  _DtState createState() => _DtState();}

  class _DtState extends State<Dt> {
    String n;

    @override
    Widget build(BuildContext context) {
      final b = Provider.of<List<UserInf>>(context);
      b.forEach((element) {
        //do smtg to doc.data

      });


      return ListView.builder(
          itemCount: b.length,
          itemBuilder: (context, index) {
           return UserTile(d: b[index],
           );
          },
      );
    }
  }