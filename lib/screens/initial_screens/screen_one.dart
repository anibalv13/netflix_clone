import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background-image.jpg',
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
      const Positioned(
        bottom: 120,
        left: 0,
        right: 0,
        child: Center(
          child: SizedBox(
            width: 350,
            child: Center(
              child: Text(
                'Unlimited films, TV programmes & more',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 42,
                ),
              ),
            ),
          ),
        ),
      ),
      const Positioned(
        bottom: 50,
        left: 0,
        right: 0,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Center(
              child: Text(
                'Watch anywhere. Cancel at any time.',
                textAlign: TextAlign.center,
                style: TextStyle(
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
