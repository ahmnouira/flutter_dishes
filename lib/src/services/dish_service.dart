import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';

class DishService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('dishes');

  /// Saving [Dish]
  void add(Dish dish) {
    _collectionReference.add(dish.toJSON());
  }

  /// Deleting [Dish]
  Future<void> delete(String id) async {
    return _collectionReference.doc(id).delete();
  }

  /// Editing [Dish]
  Future<void> edit(Dish dish) async {
    return _collectionReference.doc(dish.id).update(dish.toJSON());
  }

  /// Retrieve stream of data
  Stream<QuerySnapshot> getAll() {
    return _collectionReference.snapshots();
  }
}
