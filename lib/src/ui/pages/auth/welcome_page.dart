import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart' show AppRoutes;
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_page_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AuthPageWidget(
      children: [
        const Expanded(
          child: HeroWidget(),
        ),
        Container(
          padding: const EdgeInsets.all(Breakpoint.x1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
          ]),
        ),
      ],
    );
  }
}
