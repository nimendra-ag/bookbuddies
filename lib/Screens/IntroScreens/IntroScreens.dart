import 'package:bookbuddies/Screens/IntroScreens/Screen1.dart';
import 'package:bookbuddies/Screens/IntroScreens/Screen2.dart';
import 'package:bookbuddies/Screens/IntroScreens/Screen3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introscreens extends StatefulWidget {
  const Introscreens({super.key});

  @override
  State<Introscreens> createState() => _IntroscreensState();
}

class _IntroscreensState extends State<Introscreens> {
  PageController pageController = PageController();
  String buttonText = "Skip";
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageIndex = index;
              if (index == 3) {
                buttonText = "Finish";
              } else {
                buttonText = "Skip";
              }
            },
            children: const [Screen1(), Screen2(), Screen3()],
          ),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(buttonText),
                  ),
                  SmoothPageIndicator(controller: pageController, count: 3),
                  currentPageIndex == 2
                      ? const SizedBox(
                          width: 19,
                        )
                      : GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text("Next"),
                        )
                ],
              ))
        ]),
      ),
    );
  }
}
