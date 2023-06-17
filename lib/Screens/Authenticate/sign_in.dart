import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
            child: Text('Sign In Anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print("error signing in");
            }else{
              print("Sign In");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
