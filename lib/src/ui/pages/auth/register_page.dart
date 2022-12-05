import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';

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
    return AuthFormWidget(
      name: AuthFormName.register,
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
