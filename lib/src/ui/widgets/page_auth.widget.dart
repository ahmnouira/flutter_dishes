import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/text_field_widget.dart';

enum PageAuthName { login, register }

class PageAuthWidget extends StatelessWidget {
  final PageAuthName name;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  final void Function()? onSubmit;

  const PageAuthWidget({
    super.key,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onSubmit,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return PageWrapperWidget(children: [
      Expanded(
        child: HeroWidget(
          image: name == PageAuthName.login
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
        text: name == PageAuthName.login ? 'Log In' : 'Register',
        onPressed: onSubmit,
      ),
    ]);
  }
}
