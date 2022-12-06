import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_page_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/text_field_widget.dart';

enum AuthFormName { login, register }

class AuthFormWidget extends StatelessWidget {
  final AuthFormName name;
  final String? error;
  final bool submitting;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  final void Function()? onSubmit;

  const AuthFormWidget({
    super.key,
    required this.name,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onSubmit,
    required this.submitting,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return AuthPageWidget(children: [
      Expanded(
        child: HeroWidget(
          image: name == AuthFormName.login
              ? Assets.loginHero
              : Assets.registerHero,
        ),
      ),
      TextFieldWidget(
        placeholder: 'Enter your email',
        keyboardType: TextInputType.emailAddress,
        onChanged: onEmailChanged,
      ),
      const SizedBox(
        height: Breakpoint.x1,
      ),
      TextFieldWidget(
        placeholder: 'Enter your password',
        obscureText: true,
        onChanged: onPasswordChanged,
      ),
      if (error != null)
        Padding(
          padding: const EdgeInsets.only(top: Breakpoint.y1),
          child: Text(
            error!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ButtonWidget(
        text: name == AuthFormName.login ? 'Log In' : 'Register',
        onPressed: submitting ? null : onSubmit,
      ),
    ]);
  }
}
