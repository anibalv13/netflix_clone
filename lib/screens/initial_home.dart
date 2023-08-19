import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/commons/routes.dart';
import 'package:netflix_clone/screens/initial_screens/screen_presentation.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController _pageController = PageController();

  double _currentPage = 0;
  final Uri _url = Uri.parse(
      'https://help.netflix.com/legal/privacy?netflixsource=android&fromApp=true');

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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const ScreenPresentation(
          imagePath: 'assets/images/background-image.jpg',
          title: 'Unlimited movies, TV shows & more.',
          subtitle: 'Watch anywhere. Cancel  anytime.',
        );
      case 1:
        return const ScreenPresentation(
          imagePath: 'assets/images/screen_2.jpg',
          title: 'Download and watch offline',
          subtitle: 'Always have something to watch offline.',
        );
      case 2:
        return const ScreenPresentation(
          imagePath: 'assets/images/screee_3.jpeg',
          title: 'No annoying contracts',
          subtitle: 'Join today, cancel anytime',
        );
      case 3:
        return const ScreenPresentation(
          imagePath: 'assets/images/Screen_4.jpg',
          title: 'Watch everywhere',
          subtitle: 'Stream on your phone, tablet, laptop, TV and more.',
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Image.asset('assets/icons/icon.png'),
          actions: [
            TextButton(
                onPressed: _launchUrl,
                child: Text(
                  'Privacy'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, ROUTE_SIGNIN),
                child: Text(
                  'sign in'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
            PopupMenuButton(
                /* padding:
                    const EdgeInsets.only(right: 0, top: 0, bottom: 0, left: 0), */
                constraints:
                    const BoxConstraints.expand(width: 230, height: 110),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
                itemBuilder: (context) => [
                      const PopupMenuItem(value: 1, child: Text('FAQs')),
                      const PopupMenuItem(value: 2, child: Text('HELP'))
                    ])
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
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, ROUTE_AUTH),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 9, 20),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 20, 50),
                    padding: const EdgeInsets.all(10),
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
                  )),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: 4,
              position: _currentPage.round(),
              decorator: const DotsDecorator(
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: CircleBorder(),
                  activeColor: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
