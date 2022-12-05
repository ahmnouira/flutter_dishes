import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart' show AppRoutes;
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    return PageWrapperWidget(
      children: [
        const Expanded(
          child: HeroWidget(),
        ),
        const Center(
          child: Text(
            'My Favorite Dishes',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ButtonWidget(
          text: 'Log in',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.loginPage);
          },
        ),
        ButtonWidget(
          text: 'Register',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.registerPage);
          },
        ),
      ],
    );
  }
}
