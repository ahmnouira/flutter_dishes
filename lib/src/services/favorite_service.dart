import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';

class FavoriteService {
  CollectionReference _getCollection(String uid) {
    return FirebaseFirestore.instance.collection('users/$uid/favorites');
  }

  /// Saving favorite [Dish]
  /// users/dishId/favorites
  void add(String uid, Dish dish) {
    _getCollection(uid).doc(dish.id.toString()).set(dish.toJSON());
  }

  /// Deleting favorite [Dish]
  Future<void> delete(String uid, String dishId) async {
    return _getCollection(uid).doc(dishId).delete();
  }

  /// Retrieve stream of data
  Stream<QuerySnapshot> getAll(String uid) {
    return _getCollection(uid).snapshots();
  }
}
