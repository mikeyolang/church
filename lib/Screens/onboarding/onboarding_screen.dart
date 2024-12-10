// Name: Michael Olang
// Email: olangmichael@gmail.com
// phone: +254768241008
// github: @mikeyolang

import 'dart:async';
import 'package:flutter/material.dart';

import '../../Constants/images.dart';

import '../../data/model/onboarding_items.dart';
import '../../widgets/bottomnavigationbar.dart';
import 'dot_indicator.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;
  @override
  void initState() {
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    // isLogin();
    super.initState();
  }

  // void isLogin() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   bool? isLogin = sp.getBool("isLogin") ?? false;
  //   if (isLogin) {
  //     Timer(const Duration(seconds: 1), () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const NavBarRoots()));
  //     });
  //   } else {
  //     Timer(const Duration(seconds: 10), () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     });
  //   }
  // }

  final List<OnboardingItems> _onboardingItems = [
    OnboardingItems(
      title: "Welcome To Kanisani ",
      description: "Giving is caring",
      imagePath: onboardImageWelcome,
    ),
    OnboardingItems(
      title: "Welcome To Kanisani ",
      description: "Giving is caring",
      imagePath: onboardImageWelcome,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerry = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mediaQuerry.height,
          width: mediaQuerry.width,
          padding: const EdgeInsets.all(20),
          // Bachkground Gradient
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: [
              // Carousel Area
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemCount: _onboardingItems.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                      image: _onboardingItems[index].imagePath,
                      title: _onboardingItems[index].title,
                      description: _onboardingItems[index].description,
                    );
                  },
                ),
              ),
              // Bottom Area
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _onboardingItems.length; i++)
                    if (i == _pageIndex)
                      const DotIndicator(
                        isActive: true,
                      )
                    else
                      const DotIndicator(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: mediaQuerry.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Container()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: mediaQuerry.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Container()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuerry.height / 18.0,
              ),
              SizedBox(
                width: mediaQuerry.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bottom()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
