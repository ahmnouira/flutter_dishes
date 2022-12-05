import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_dishes/src/ui/pages/dishes_page.dart';
import 'package:flutter_dishes/src/ui/pages/login_page.dart';
import 'package:flutter_dishes/src/ui/pages/register_page.dart';
import 'package:flutter_dishes/src/ui/pages/welcome_page.dart';

/// Using class [AppRoutes]
class AppRoutes {
  static const welcomePage = WelcomePage.routeName;
  static const loginPage = LoginPage.routeName;
  static const registerPage = RegisterPage.routeName;
  static const dishesPage = DishesPage.routeName;
}

String initialRoute = WelcomePage.routeName;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomePage.routeName: (context) => const WelcomePage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  DishesPage.routeName: (context) => const DishesPage(),
};
