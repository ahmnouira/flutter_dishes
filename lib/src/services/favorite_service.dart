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

  Future<bool> foundOne(String uid, String id) async {
    final dishDocument = await get(uid, id);

    return dishDocument.exists;
  }

  /// Toggling favorite[Dish]
  Future<void> toggle(String uid, Dish dish) async {
    final found = await foundOne(uid, dish.id);
    if (found) {
      await delete(uid, dish.id);
    } else {
      await add(uid, dish);
    }
  }

  /// Getting once all
  Future<QuerySnapshot> getOnceAll(String uid) {
    return _getCollection(uid).get();
  }

  Future<List<Dish>> getAllOnceByUid(String uid) async {
    final List<Dish> list = [];
    final snapshots = await getOnceAll(uid);
    final docs = snapshots.docs;
    for (final doc in docs) {
      final favorite = Dish.fromSnapshot(doc);
      list.add(favorite);
    }

    return list;
  }

  List<Dish> getAllByUid(String uid) {
    final List<Dish> list = [];
    final snapshots = getAll(uid);

    snapshots.forEach((element) {
      for (final doc in element.docs) {
        print(doc);

        final dish = Dish.fromSnapshot(doc);
        list.add(dish);
      }
    });

    return list;
  }

  /// Retrieve stream of data
  Stream<QuerySnapshot> getAll(String uid) {
    return _getCollection(uid).snapshots();
  }
}
