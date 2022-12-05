import 'package:flutter_dishes/src/data/admins.dart';

bool isAdmin(String email) {
  return admins.contains(email);
}
