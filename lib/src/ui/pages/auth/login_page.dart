import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';

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
    return AuthFormWidget(
      name: AuthFormName.login,
      onEmailChanged: (value) {
        _email = value;
      },
      onPasswordChanged: (value) {
        _password = value;
      },
      onSubmit: submit,
    );
  }
}
