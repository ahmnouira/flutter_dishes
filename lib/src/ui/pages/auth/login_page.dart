import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';
import 'package:flutter_dishes/src/utils/check_fields.dart';
import 'package:flutter_dishes/src/utils/is_admin.dart';
import 'package:flutter_dishes/src/utils/timer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  String _error = '';
  bool _submitting = false;

  Future<void> _onSubmit() async {
    setState(() {
      _submitting = true;
      _error = '';
    });
    final String error = checkAuthFields(_email, _password);

    if (error.isNotEmpty) {
      setState(() {
        _error = error;
        _submitting = false;
      });

      return;
    }
    final authService = AuthService();

    try {
      final firebaseUser = await authService.login(_email, _password);
      if (firebaseUser == null) {
        return;
      }

      setState(() {
        _email = '';
        _password = '';
      });

      delayMilliseconds(
        milliseconds: 0,
        callback: () {
          Navigator.pushNamed(
            context,
            isAdmin(_email) ? AppRoutes.adminDishesPage : AppRoutes.dishesPage,
          );
        },
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        _error = authService.handleFirebaseAuthExceptions(error);
        _submitting = false;
      });
    } catch (e) {
      setState(() {
        _error = authService.handleError(e);
        _submitting = false;
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
      onSubmit: _onSubmit,
      error: _error,
      submitting: _submitting,
    );
  }
}
