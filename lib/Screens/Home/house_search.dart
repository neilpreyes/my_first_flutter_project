import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_project/Models/houses.dart';
import 'package:my_first_flutter_project/Screens/Home/houseTile.dart';

//Allows to search database and list on home page accordingly
class HouseSearch extends StatefulWidget {
  @override
  _HouseSearchState createState() => _HouseSearchState();
}

class _HouseSearchState extends State<HouseSearch> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<List<houses>>(
      builder: (context, homes, _) {
        List<houses> filteredHomes = homes
            .where((house) =>
        house.name!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            house.address!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            house.zipcode.toString().contains(_searchQuery))
            .where((house) => house.zipcode != 0) // Filter out zipcode equal to 0
            .toList();

        return Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredHomes.length,
                itemBuilder: (context, index) {
                  return HouseTile(house: filteredHomes[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}


