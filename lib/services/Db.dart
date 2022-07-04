import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:artisants/Module/UserInf.dart';
import 'package:artisants/Module/Useer.dart';

class Db{
  

  final String uid;
  Db({this.uid});

  final CollectionReference C= FirebaseFirestore.instance.collection('artis');
  Future UserUpdateData(String name, String ln,int age  ) async{
    return await C.doc(uid).set({
      'name': name,
      'ln': ln,
      'age': age
    });
  }


  List<UserInf> _usrlstfromsnapshot(QuerySnapshot snpsht){
    return snpsht.docs.map((doc) {
      return UserInf(
          name: doc.data()['name'] ?? '',
          lastname: doc.data()['ln'] ?? '',
          age: doc.data()['age'] ?? 0
      );
    }).toList();

    }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'],
        ln: snapshot.data()['ln'],
        age: snapshot.data()['age']
    );
  }
  Stream<List<UserInf>> get dt{
    return C.snapshots().map(_usrlstfromsnapshot);}


  Stream<UserData> get userData {
    return C.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


//if we don't use list to trat each obj wa7dou
 /* Stream<QuerySnapshot> get dt{
    return C.snapshots();
  }*/


}