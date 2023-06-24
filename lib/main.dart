import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Services/auth.dart';
import 'package:provider/provider.dart';
import 'Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Services/auth.dart';
import 'Models/UserId.dart';

//Main screen => sign in or register
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return StreamProvider<UserId?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}