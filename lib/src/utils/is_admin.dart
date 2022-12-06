import 'package:flutter_dishes/src/data/admins.dart';

bool isAdmin(String? email) {
  if (email == null) {
    throw 'Email email';
  }

  return admins.contains(email.toLowerCase().trim());
}
