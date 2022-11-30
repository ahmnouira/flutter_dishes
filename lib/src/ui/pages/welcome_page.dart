import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart' show AppRoutes;
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const id = 'welcome';

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
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(
          height: Breakpoint.x1,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.loginPage);
          },
          clipBehavior: Clip.antiAlias,
          child: const Text(
            'Log in',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        const SizedBox(
          height: Breakpoint.x1,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.registerPage);
          },
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ],
    );
  }
}
