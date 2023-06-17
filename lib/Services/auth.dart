import 'package:firebase_auth/firebase_auth.dart';
import "package:my_first_flutter_project/Models/UserId.dart";

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

// create UserId object based on User
  UserId? _userfromFirebase(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<UserId?> get user{
    return _auth.authStateChanges().map((User? user)=> _userfromFirebase(user!));
  }

  //Anonlymous Sign-In
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }

  //Sign in with email and password

  //Register with email and password

  //Signing Out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

}