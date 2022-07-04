import 'package:firebase_auth/firebase_auth.dart';
import 'package:artisants/Module/Useer.dart';
import 'package:artisants/services/Db.dart';



class AuthService{


  final FirebaseAuth _auth= FirebaseAuth.instance;
  String n='';
  String fn='';
  int ag=3;


  //create obj base on firebase user
  Useer _UserFromFirebaseUser(User usr){
    return usr!=null? Useer(uid: usr.uid):null;
  }

  //auth changes user stream
    Stream<Useer> get Uuu{
    return _auth.authStateChanges().map((User u)=>_UserFromFirebaseUser(u));
    //return _auth.authStateChanges().map(_UserFromFirebaseUser);

  }
//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }}





  //sign in anon



  Future signInAnoun() async{

    try{
      UserCredential result=await _auth.signInAnonymously();
         User user= result.user;
         return _UserFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

}}


  // sign in with email and password
  Future signInWithEmailAndPassword(String em, String pw) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: em, password: pw);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User u = result.user;
      //create doc for user
      await Db(uid: u.uid ).UserUpdateData(n, fn, ag);
      return _UserFromFirebaseUser(u);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


}
