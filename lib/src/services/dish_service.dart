import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';

class DishService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('dishes');

  /// Getting [Dish]
  Future<DocumentSnapshot> get(String id) async {
    return _collectionReference.doc(id).get();
  }

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

  /// Getting once all
  Future<QuerySnapshot> getOnceAll() {
    return _collectionReference.get();
  }

  /// Getting user favorites
  Future<List<Dish>> getAllFavoriteByUid(String uid) async {
    final List<Dish> list = [];
    final snapshots = await getOnceAll();
    final docs = snapshots.docs;
    for (final doc in docs) {
      final favorite = Dish.fromSnapshot(doc);
      if (favorite.favoriteBy.contains(uid)) {
        list.add(favorite);
      }
    }

    return list;
  }

  /// Toggling [Dish]
  Future<void> toggle(String uid, String id) async {
    final doc = await get(id);
    final favoriteBy = doc.get('favorite_by') as List<String>;

    if (favoriteBy.contains(uid)) {
      favoriteBy.remove(uid);
    } else {
      favoriteBy.add(uid);
    }

    return _collectionReference.doc(id).update({'favorite_by': favoriteBy});
  }
}
