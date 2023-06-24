import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Screens/Authenticate/sign_in.dart';
import 'package:my_first_flutter_project/Screens/Authenticate/register.dart';

//main authentication widget
class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){//toggles between sign in and register states
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
}
