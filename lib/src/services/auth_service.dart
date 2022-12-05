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

  Future<User?> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (error) {
      throw error.code;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // final auth = result.user;
      return result.user;
    } on FirebaseAuthException catch (error) {
      throw error.code;
      //return _handleFirebaseAuthExceptions(error);
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String? handleFirebaseAuthExceptions(FirebaseAuthException error) {
    if (error.code == 'weak-password') {
      if (kDebugMode) {
        throw 'The password is provided is too weak.';
      }
    } else if (error.code == 'email-already-in-use') {
      if (kDebugMode) {
        throw 'The account already exists for that email.';
      }
    }

    return error.message;
  }

  String? handleError(Object error) {
    return error.toString();
  }
}
