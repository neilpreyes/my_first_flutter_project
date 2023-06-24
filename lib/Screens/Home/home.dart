import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Services/auth.dart';
import 'package:my_first_flutter_project/Screens/Authenticate/authenticate.dart';
import 'package:my_first_flutter_project/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_project/Screens/Home/house_list.dart';
import 'package:my_first_flutter_project/Models/houses.dart';
import 'package:my_first_flutter_project/Screens/Home/create_form.dart';
import 'package:my_first_flutter_project/Screens/Home/house_search.dart';

//Home Screen that lists ratings automatically
class Home extends StatelessWidget {
  //const Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showCreatePanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: CreateForm(),
        );
      });
    }

    void _showSearchPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return StreamProvider<List<houses>>.value(
          initialData: [],
          value: DatabaseService().house,
          child: HouseSearch(),
        );
      });
    }


    return StreamProvider<List<houses>>.value(
      initialData: [],
      value: DatabaseService().house,
      child: Scaffold(
        backgroundColor: Colors.amber[300],
        //Colors.blue[100],
        appBar: AppBar(
          title: Text("CPP Housing Rating"),
          backgroundColor: Colors.green[900],
          //Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              //label: Text('Search'),
              onPressed: () => _showSearchPanel(),//TODO FIX
            ),
            IconButton(//outlines button before
              icon: Icon(Icons.add),
              //label: Text('Create'),
              onPressed: () => _showCreatePanel(),
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: HouseList(),
      ),
    );
  }
}
