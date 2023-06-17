import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Services/auth.dart';
import 'package:my_first_flutter_project/Screens/Authenticate/authenticate.dart';

class Home extends StatelessWidget {
  //const Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("CPP Housing Rating"),
        backgroundColor: Colors.red[300],
        elevation: 0.0,
        actions: <Widget>[
          OutlinedButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
