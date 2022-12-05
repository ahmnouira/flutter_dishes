import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';
import 'package:flutter_dishes/src/utils/check_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _email;
  String? _password;
  String? _error = '';

  void getUser() {}

  void submit() {
    final String error = checkAuthFields(_email, _password);

    if (error.isNotEmpty) {
      setState(() {
        _error = error;
      });

      return;
    }

    if (kDebugMode) {
      print({'email': _email, 'password': _password});
    }

    // submit
    try {
      Navigator.pushNamed(context, AppRoutes.loginPage);
    } catch (e) {
      throw e.toString();
    } finally {
      setState(() {
        _error = '';
      });
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
      error: _error,
    );
  }
}
