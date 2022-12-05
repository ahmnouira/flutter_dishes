import 'package:firebase_auth/firebase_auth.dart';

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
    } catch (error) {
      rethrow;
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

  String handleFirebaseAuthExceptions(FirebaseAuthException error) {
    String message = error.code;

    if (message == 'weak-password') {
      message = 'The password is provided is too weak.';
    } else if (message == 'email-already-in-use') {
      message = 'The account already exists for that email.';
      // user-not-found
      // invalid-email
      // wrong-password
    }

    return message;
  }

  String handleError(Object error) {
    return error.toString();
  }
}
