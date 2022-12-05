import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart';
import 'package:flutter_dishes/src/data/model/app_user.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/services/user_service.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_form_widget.dart';
import 'package:flutter_dishes/src/utils/check_fields.dart';
import 'package:flutter_dishes/src/utils/timer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _password = '';
  String _error = '';
  bool _submitting = false;

  Future<void> _onSubmit() async {
    setState(() {
      _submitting = true;
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
    final userService = UserService();

    // submit
    try {
      final firebaseUser = await authService.register(_email, _password);
      if (firebaseUser == null) {
        setState(() {
          _error = 'Please try again';
        });

        return;
      }
      print('FirebaseUser: $firebaseUser');
      final user = AppUser(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? _email,
      );
      userService.add(user);
      delayMilliseconds(
        callback: () {
          setState(() {
            _email = '';
            _password = '';
          });
          Navigator.pushNamed(context, AppRoutes.loginPage);
        },
      );
    } catch (e) {
      print(e);
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _error = '';
        _submitting = false;
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
      onSubmit: _onSubmit,
      error: _error,
      submitting: _submitting,
    );
  }
}
