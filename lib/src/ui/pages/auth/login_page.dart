import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _password;

  void getUser() {}

  void submit() {
    if (kDebugMode) {
      print({'email': _email, 'password': _password});
    }

    setState(() {});
    // submit
    try {
      Navigator.pushNamed(context, AppRoutes.dishesPage);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapperWidget(children: [
      const Expanded(
        child: HeroWidget(
          image: Assets.loginHero,
        ),
      ),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your email',
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          _email = value;
        },
        style: const TextStyle(
          fontSize: Breakpoint.x1,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: Breakpoint.y1,
      ),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your password',
        ),
        obscureText: true,
        onChanged: (value) {
          _password = value;
        },
        style: const TextStyle(
          fontSize: Breakpoint.x1,
          color: Colors.white,
        ),
      ),
      ButtonWidget(
        text: 'Log In',
        onPressed: submit,
      ),
    ]);
  }
}