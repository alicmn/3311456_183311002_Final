import 'package:flutter/material.dart';
import 'package:sneakers_app/weather/presentation/pages/weather_app.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Weather>(builder: (context) => Weather());

      default:
        return MaterialPageRoute<Weather>(builder: (context) => Weather());
    }
  }
}
