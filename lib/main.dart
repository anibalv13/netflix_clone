import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/initial_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Netflix', primarySwatch: Colors.red),
        home: const InitialPage());
  }
}
