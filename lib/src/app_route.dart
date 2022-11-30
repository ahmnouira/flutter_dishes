import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_dishes/src/ui/pages/dishes_page.dart';
import 'package:flutter_dishes/src/ui/pages/login_page.dart';
import 'package:flutter_dishes/src/ui/pages/register_page.dart';
import 'package:flutter_dishes/src/ui/pages/welcome_page.dart';

/// Using class [AppRoutes]
class AppRoutes {
  static const welcomePage = WelcomePage.id;
  static const loginPage = LoginPage.id;
  static const registerPage = RegisterPage.id;
  static const dishesPage = DishesPage.id;
}

String initialRoute = WelcomePage.id;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomePage.id: (context) => const WelcomePage(),
  LoginPage.id: (context) => const LoginPage(),
  RegisterPage.id: (context) => const RegisterPage(),
  DishesPage.id: (context) => const DishesPage(),
};
