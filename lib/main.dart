import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sinterface/controllers/orders.dart';
import 'package:sinterface/pages/home/home.dart';
import 'package:sinterface/pages/order/order.dart';

import 'colors.dart';

void main() {
  GetIt.I.registerSingleton(OrdersController());
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
      routes: {
        HomePage.route: (context) => HomePage(),
        OrderPage.route: (context) => OrderPage()
      },
    );
  }
}
