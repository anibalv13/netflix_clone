// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth/auth.dart';
import 'package:netflix_clone/screens/initial_home.dart';
import 'package:page_transition/page_transition.dart';

const String ROUTE_INITIAL = "/initialPage";
const String ROUTE_AUTH = "/auth";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/initialPage":
        return PageTransition(
            child: const InitialPage(), type: PageTransitionType.topToBottom);
      case "/auth":
        return PageTransition(
            child: const Auth(), type: PageTransitionType.bottomToTop);
      default:
        return MaterialPageRoute(builder: (_) => const InitialPage());
    }
  }
}
