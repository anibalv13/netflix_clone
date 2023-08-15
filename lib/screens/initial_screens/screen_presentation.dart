import 'package:flutter/material.dart';

class ScreenPresentation extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const ScreenPresentation(
      {super.key,
      required this.imagePath,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.transparent,
            Color.fromARGB(210, 0, 0, 0),
            Colors.black
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
      Positioned(
        bottom: 120,
        left: 0,
        right: 0,
        child: Center(
          child: SizedBox(
            width: 350,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 42,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 50,
        left: 0,
        right: 0,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
