import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Image.asset(
        'assets/images/screen_2.jpg',
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
      Container(
        width: width,
        height: height,
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
                'Download and watch offline',
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
                'Always have something to watch offline.',
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
