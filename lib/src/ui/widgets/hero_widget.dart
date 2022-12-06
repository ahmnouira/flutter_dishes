import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/assets/assets.dart';

class HeroWidget extends StatelessWidget {
  final String image;

  const HeroWidget({super.key, this.image = Assets.welcomeHero});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
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
