import 'package:flutter/material.dart';

class PageWrapperWidget extends StatelessWidget {
  final List<Widget> children;

  final double padding;

  const PageWrapperWidget({
    super.key,
    required this.children,
    this.padding = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
