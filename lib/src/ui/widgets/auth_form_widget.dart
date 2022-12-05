import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/auth_wrapper_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/text_field_widget.dart';

enum AuthFormName { login, register }

class AuthFormWidget extends StatelessWidget {
  final AuthFormName name;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  final void Function()? onSubmit;

  const AuthFormWidget({
    super.key,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onSubmit,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AuthWrapperWidget(children: [
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
        height: Breakpoint.y1,
      ),
      TextFieldWidget(
        placeholder: 'Enter your password',
        obscureText: true,
        onChanged: onPasswordChanged,
      ),
      ButtonWidget(
        text: name == AuthFormName.login ? 'Log In' : 'Register',
        onPressed: onSubmit,
      ),
    ]);
  }
}
