import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  // id
  final String id;
  final bool exists;
  final String name;
  final DateTime createdAt;
  final List<String> favoriteBy;

  const Dish({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.favoriteBy,
    this.exists = true,
  });

  factory Dish.fromJSON(Map<String, dynamic> json) => Dish(
        id: json['id'] as String,
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        favoriteBy: List<String>.from(json['favorite_by']),
      );

  // To save only the name of the dish in the db
  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'created_at': createdAt.toString(),
      'favorite_by': favoriteBy,
    };
  }

  /// Takes a Firestore document and converts to a [Dish]
  factory Dish.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.reference.id;
    data['exits'] = snapshot.exists;

    return Dish.fromJSON(data);
  }

  @override
  String toString() {
    final map = toJSON();
    // adding the id
    map['id'] = id;
    map['exits'] = exists;

    return map.toString();
  }
}
