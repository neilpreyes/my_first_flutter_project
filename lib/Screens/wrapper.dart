import 'package:flutter/material.dart';
import 'home/home.dart';
import 'Authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import "package:my_first_flutter_project/Models/UserId.dart";

//Wrapper dictates to go to Authentication screen or Home screen accordingly
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId?>(context);

    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
