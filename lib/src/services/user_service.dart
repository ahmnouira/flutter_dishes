import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dishes/src/data/model/app_user_model.dart';

class UserService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  /// Saving [AppUser]
  void add(AppUser user) {
    _collectionReference.doc(user.id).set(user.toJSON());
  }

  /// Getting [AppUser]
  void get(String uid) {
    _collectionReference.doc(uid).get();
  }
}
