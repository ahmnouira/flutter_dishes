import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const id = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      const Flexible(child: HeroWidget()),
      const SizedBox(
        height: 18.0,
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
        height: 8.0,
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
      const SizedBox(
        height: 24.0,
      ),
      ElevatedButton(
        onPressed: submit,
        child: const Text(
          'Register',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    ]);
  }
}
