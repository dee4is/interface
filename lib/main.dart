import 'package:flutter/material.dart';
import 'package:sinterface/pages/home/home.dart';

import 'colors.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(scrollbars: true),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
