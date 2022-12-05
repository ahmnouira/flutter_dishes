import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = 'register';

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
      Navigator.pushNamed(context, AppRoutes.loginPage);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapperWidget(children: [
      const Expanded(
        child: HeroWidget(
          image: Assets.registerHero,
        ),
      ),
      TextFieldWidget(
        placeholder: 'Enter your email',
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          _email = value;
        },
      ),
      const SizedBox(
        height: Breakpoint.y1,
      ),
      TextFieldWidget(
        placeholder: 'Enter your password',
        obscureText: true,
        onChanged: (value) {
          _password = value;
        },
      ),
      ButtonWidget(
        text: 'Register',
        onPressed: submit,
      ),
    ]);
  }
}
