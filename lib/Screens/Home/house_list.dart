import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_project/Models/houses.dart';
import 'package:my_first_flutter_project/Screens/Home/houseTile.dart';

//Lists homes on home screen
class HouseList extends StatefulWidget {
  @override
  State<HouseList> createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  @override
  Widget build(BuildContext context) {

    final homes = Provider.of<List<houses>>(context);
    // print(houses.docs);
    if(homes != null){
      homes.forEach((cpp) {
        print(cpp.name);
        print(cpp.address);
        print(cpp.zipcode);
        print(cpp.rating);
      });
    }

    return ListView.builder(
      itemCount: homes.length,
      itemBuilder: (context, index) {
        if(homes[index].zipcode != 0){
          return HouseTile(house: homes[index]);
        }else{
          return Container();
        }

      },
    );
  }
}
