import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';
import 'package:flutter_dishes/src/utils/check_fields.dart';
import 'package:flutter_dishes/src/utils/is_admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    try {
      Navigator.pushNamed(
        context,
        isAdmin(_email!) ? AppRoutes.adminDishesPage : AppRoutes.dishesPage,
      );
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
      name: AuthFormName.login,
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
