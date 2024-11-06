import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innotech/main.dart';
import 'package:innotech/view/pages/home_sliders.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _descriptionController;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<Offset> _textOffset;
  late Animation<double> _buttonAnimation;

  final String text =
      "Elevate yourr brand with our mobile andd web development expertise. We specialize in UI/UX design and captivating video editing. Transform your ideas into engaging digital experiences!";
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Adjust for timing
      vsync: this,
    );

    _descriptionController = AnimationController(
      duration: const Duration(seconds: 6), // Adjust for timing
      vsync: this,
    );

    _animations = text.split(' ').map((word) {
      int index = text.split(' ').indexOf(word);
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _descriptionController,
          // curve: const Interval(0.7, 1, curve: Curves.easeOut),
          curve: Interval(
            index / text.split(' ').length,
            (index + 1) / text.split(' ').length,
            curve: Curves.easeIn,
          ),
        ),
      );
    }).toList();

    // Logo Animation
    _logoAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
          parent: _controller,
          // curve: const Interval(0.7, 1, curve: Curves.easeOut),
          curve: Curves.easeOut),
    );

    // Text Animation
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textOffset =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
          parent: _descriptionController,
          curve: Interval(0, 1, curve: Curves.easeIn)),
    );

    // Button Animation
    _buttonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(.5, 1, curve: Curves.easeOut)),
    );

    _descriptionController.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: .1,
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Animation
                  SlideTransition(
                    position: _logoAnimation,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/innotech_logo.png',
                          height: 200,
                          filterQuality: FilterQuality.high,
                        )),
                  ),
            
                  const SizedBox(height: 50),
            
                  SlideTransition(
                    position: _logoAnimation,
                    child: Text(
                      'InnoTech Solutions',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
            
                  const SizedBox(height: 20),
            
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: text.split(' ').map((word) {
                      int index = text.split(' ').indexOf(word);
                      return Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: FadeTransition(
                          opacity: _animations[index],
                          child: Text(word),
                        ),
                      );
                    }).toList(),
                  ),
            
                  const SizedBox(height: 50),
            
                  // Button Animation
                  FadeTransition(
                    opacity: _buttonAnimation,
                    child: Container(
                      width: size.width * .6,
                            height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(HomeSliders());
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                        child: Text("SEE MORE" , ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
