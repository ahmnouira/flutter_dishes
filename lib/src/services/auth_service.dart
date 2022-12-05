import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  // Return the id of the current user, which could null
  String? get uid => currentUser?.uid;

  // Return the email of the current user
  String? get email => currentUser?.email;

  bool? get isEmailVerified => currentUser?.emailVerified;

  Future<String?> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user?.uid;
    } on FirebaseAuthException catch (error) {
      return _handleFirebaseAuthExceptions(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // final auth = result.user;
      return result.user?.uid;
    } on FirebaseAuthException catch (error) {
      return _handleFirebaseAuthExceptions(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String? _handleFirebaseAuthExceptions(FirebaseAuthException error) {
    if (error.code == 'weak-password') {
      if (kDebugMode) {
        print('The password is provided is too weak.');
      }
    } else if (error.code == 'email-already-in-use') {
      if (kDebugMode) {
        print('The account already exists for that email.');
      }
    }

    return error.message;
  }

  String? _handleError(Object error) {
    return error.toString();
  }
}
