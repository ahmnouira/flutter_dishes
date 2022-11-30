import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/app_route.dart' show routes, initialRoute;

// The root widget of the app
class App extends StatelessWidget {
  /// Creates an [App] instance.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hiding the debug banner,
      debugShowCheckedModeBanner: false,
      title: 'FlutterDishes',
      theme: ThemeData.dark(),
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
