import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picsart/src/presentation/views/navigation_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const NavigationPage());
      default:
        return _materialRoute(const NavigationPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route onUnkownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const NavigationPage());
  }
}
