import 'package:firebase_auth/firebase_auth.dart';
import "package:my_first_flutter_project/Models/UserId.dart";
import 'package:my_first_flutter_project/Services/database.dart';

//Firebase authentication service
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
  Future signInWithEmailandPassword(var email, var password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userfromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailandPassword(var email, var password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //Create a new document for the user with the uid
      await DatabaseService(uid: user?.uid).updateUserData('name', 'address', 0, 0);

      return _userfromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

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