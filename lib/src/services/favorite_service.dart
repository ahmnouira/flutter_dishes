import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';

class FavoriteService {
  CollectionReference _getCollection(String uid) {
    return FirebaseFirestore.instance.collection('users/$uid/favorites');
  }

  /// Saving favorite [Dish]
  /// users/dishId/favorites
  Future<void> add(String uid, Dish dish) async {
    return _getCollection(uid).doc(dish.id.toString()).set(dish.toJSON());
  }

  /// Deleting favorite [Dish]
  Future<void> delete(String uid, String id) async {
    return _getCollection(uid).doc(id).delete();
  }

  /// /// Getting favorite [Dish]
  Future<DocumentSnapshot> get(String uid, String id) async {
    return _getCollection(uid).doc(id).get();
  }

  /// Toggling favorite[Dish]
  Future<void> toggle(String uid, Dish dish) async {
    final dishDocument = await get(uid, dish.id);
    if (dishDocument.exists) {
      await delete(uid, dish.id);
    } else {
      await add(uid, dish);
    }
  }

  /// Retrieve stream of data
  Stream<QuerySnapshot> getAll(String uid) {
    return _getCollection(uid).snapshots();
  }
}
