import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/initial_screens/screen_four.dart';
import 'package:netflix_clone/screens/initial_screens/screen_one.dart';
import 'package:netflix_clone/screens/initial_screens/screen_three.dart';
import 'package:netflix_clone/screens/initial_screens/screen_two.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController _pageController = PageController();

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage(int index) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    switch (index) {
      case 0:
        return const ScreenOne();
      case 1:
        return const ScreenTwo();
      case 2:
        return const ScreenThree();
      case 3:
        return const ScreenFour();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Image.asset('assets/icons/icon.png'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Privacy'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'sign in'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )),
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
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
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildPage(index);
                },
              ),
            ),
            DotsIndicator(
              dotsCount: 4,
              position: _currentPage.round(),
              decorator: const DotsDecorator(
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: CircleBorder(),
                  activeColor: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 229, 9, 20),
                  minimumSize: Size(MediaQuery.of(context).size.width - 20,
                      50), // Tamaño mínimo del botón
                  padding:
                      const EdgeInsets.all(10), // Espaciado interno del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Text(
                  'Get started'.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}
