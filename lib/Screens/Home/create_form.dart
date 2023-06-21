import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_flutter_project/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/shared/constants.dart';
import '../../Services/database.dart';

class CreateForm extends StatefulWidget {

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {

  final _formKey = GlobalKey<FormState>();
  final List<int> rating = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  //form values
  String? _currentName;
  String? _currentAddress;
  int? _currentZipcode;
  int? _currentRating;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Create a listing',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 4.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Enter your Name'),
            validator: (val) => (val != null && val.isEmpty) ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 4.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Enter an Address'),
            validator: (val) => (val != null && val.isEmpty) ? 'Please enter an address' : null,
            onChanged: (val) => setState(() => _currentAddress = val),
          ),
          SizedBox(height: 4.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Enter a zipcode'),
            validator: (val) => (val != null && val.isEmpty) ? 'Please enter a zipcode' : null,
            onChanged: (val) => setState(() => _currentZipcode = int.parse(val)),
          ),
          SizedBox(height: 4.0),
          //slider
          Slider(
            value: (_currentRating ?? 0.0).toDouble(),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blue[100],
            min: 0.0,
            max: 10.0,
            divisions: 11,
            label: 'Rating: ${_currentRating?.round().toString()}',
            onChanged: (val) => setState(() => _currentRating = val.round()),
          ),

          //Button
          ElevatedButton(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
               print("Hello " + _formKey.currentState!.toString());
               print(_currentName);
               print(_currentAddress);
               print(_currentZipcode);
               print(_currentRating);
              if (_formKey.currentState!.validate()) {
                // Form validation passed, proceed with creating a new document
                DocumentReference docRef = await DatabaseService().createNewUserData(
                  _currentName!,
                  _currentAddress!,
                  _currentZipcode!,
                  _currentRating!,
                );
                // Reset form fields
                _formKey.currentState!.reset();
                // Access the document ID of the newly created document
                String documentId = docRef.id;
                print('New document created with ID: $documentId');
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue[700]),
          ),
        ],
      ),
    );
  }
}
