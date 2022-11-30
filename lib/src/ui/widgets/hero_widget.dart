import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';

class HeroWidget extends StatelessWidget {
  final String image;

  const HeroWidget({super.key, this.image = Assets.welcomeHero});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        padding: const EdgeInsets.only(bottom: Breakpoint.x2),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
