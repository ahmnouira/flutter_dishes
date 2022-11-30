import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart' show AppRoutes;
import 'package:flutter_dishes/src/data/assets/assets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'logo',
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    Assets.welcomeHero,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
              height: 16.0,
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
              height: 16.0,
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
        ),
      ),
    );
  }
}
