import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';

class PageWrapperWidget extends StatelessWidget {
  final List<Widget> children;

  final double padding;

  const PageWrapperWidget({
    super.key,
    required this.children,
    this.padding = Breakpoint.x1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
