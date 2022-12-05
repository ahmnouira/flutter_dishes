import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  // id
  final String id;
  final String name;

  const Dish({required this.id, required this.name});

  factory Dish.fromJSON(Map<String, dynamic> json) =>
      Dish(id: json['id'] as String, name: json['name'] as String);

  // To save only the name of the dish in the db
  Map<String, dynamic> toJSON() {
    return {
      'name': name,
    };
  }

  /// Takes a Firestore and converts to a [Dish]
  factory Dish.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.reference.id;
    // data['exits'] = snapshot.exists;

    return Dish.fromJSON(data);
  }

  @override
  String toString() {
    final map = toJSON();
    // adding the id
    map['id'] = id;

    return map.toString();
  }
}
