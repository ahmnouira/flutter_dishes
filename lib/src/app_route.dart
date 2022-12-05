import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_dishes/src/ui/pages/admin/admin_dishes_page.dart';
import 'package:flutter_dishes/src/ui/pages/auth/login_page.dart';
import 'package:flutter_dishes/src/ui/pages/auth/register_page.dart';
import 'package:flutter_dishes/src/ui/pages/auth/welcome_page.dart';
import 'package:flutter_dishes/src/ui/pages/user/dishes_page.dart';
import 'package:flutter_dishes/src/ui/pages/user/favorites_page.dart';

/// Using class [AppRoutes]
class AppRoutes {
  static const welcomePage = WelcomePage.routeName;
  static const loginPage = LoginPage.routeName;
  static const registerPage = RegisterPage.routeName;
  static const dishesPage = DishesPage.routeName;
  static const favoritesPage = FavoritesPage.routeName;
  static const adminDishesPage = AdminDishesPage.routeName;
}

String initialRoute = WelcomePage.routeName;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomePage.routeName: (context) => const WelcomePage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  DishesPage.routeName: (context) => const DishesPage(),
  FavoritesPage.routeName: (context) => const FavoritesPage(),
  AdminDishesPage.routeName: (context) => const AdminDishesPage(),
};
