import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/utils/timer.dart';

enum PageContext {
  user,
  userFavorite,
  admin,
}

class PageWidget {
  void _logout(BuildContext context) {
    final authService = AuthService();
    authService.logout();
    delayMilliseconds(
      milliseconds: 0,
      callback: () {
        Navigator.pushReplacementNamed(context, AppRoutes.welcomePage);
      },
    );
  }

  static AppBar buildSimpleAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  AppBar buildAppBar(
    BuildContext context,
    String title,
    PageContext pageContext,
  ) {
    final isFavoritePage = pageContext == PageContext.userFavorite;
    final isUserDishesPages = pageContext == PageContext.user;

    return AppBar(
      automaticallyImplyLeading: isFavoritePage,
      title: Text(title),
      actions: isFavoritePage
          ? null
          : [
              IconButton(
                onPressed: () {
                  _logout(context);
                },
                icon: const Icon(Icons.logout_outlined),
              ),
              if (isUserDishesPages)
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.favoritesPage);
                  },
                  icon: const Icon(Icons.star),
                ),
            ],
    );
  }
}
