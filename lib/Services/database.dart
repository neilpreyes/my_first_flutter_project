import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_flutter_project/Models/houses.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference housing = FirebaseFirestore.instance.collection('CPP');

  Future updateUserData(String name, String address, int zipcode, int rating) async {
    return await housing.doc(uid).set({
      'name': name,
      'address': address,
      'zipcode': zipcode,
      'rating': rating
    });
  }

  Future<DocumentReference> createNewUserData(String? name, String? address, int? zipcode, int? rating) async {
    return await housing.add({
      'name': name ?? '',
      'address': address ?? '',
      'zipcode': zipcode ?? 0,
      'rating': rating ?? 0,
    });
  }

  //Housing list from snapshot
  List<houses> _houseListFromSnapshot(QuerySnapshot snapshot){

      return snapshot.docs.map((doc){
        return houses(
          name: doc.get('name').toString() ?? '',
          address: doc.get('address') ?? '',
          zipcode: doc.get('zipcode') ?? 0,
          rating: doc.get('rating') ?? 0,
        );
      }).toList();

  }

  //Get housing stream
  Stream<List<houses>> get house{
    return housing.snapshots().map(_houseListFromSnapshot);
  }

  Stream<List<houses>> getHousesByZipcode(String zipcode) {
    return housing.where('zipcode', isEqualTo: zipcode).snapshots().map(_houseListFromSnapshot);
  }

}