import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/ui/widgets/hero_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_wrapper_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const id = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _email;
  String? _password;

  void getUser() {}

  @override
  Widget build(BuildContext context) {
    return const PageWrapperWidget(children: [
      Flexible(child: HeroWidget()),
      SizedBox(
        height: 18.0,
      ),
    ]);
  }
}
