// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/initial_home.dart';

const String ROUTE_INITIAL = "/login";
const String ROUTE_REGISTER = "/register";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case "/register":
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => const InitialPage());
    }
  }
}
