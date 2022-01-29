import 'package:flutter/material.dart';
import 'package:on_market_challenge/presentation/screens/cart_screen/cart_screen.dart';
import 'package:on_market_challenge/presentation/screens/home/home_screen.dart';

import 'app_routes_name.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutesName.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRoutesName.checkout:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error Route'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
