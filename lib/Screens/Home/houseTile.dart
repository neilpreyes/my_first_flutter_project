import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/Models/houses.dart';

//Card layout for house listings
class HouseTile extends StatelessWidget {
  final houses? house;
  HouseTile({this.house});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.orange[700],
            child: Text(
                (house?.rating).toString() + "/10",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          title: Text((house?.name).toString()),
          subtitle: Text('Address: ' + (house?.address).toString() + ' '  +(house?.zipcode).toString()),
        ),
      ),
    );
  }
}
