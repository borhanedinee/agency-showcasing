import 'package:flutter/material.dart';
import 'package:innotech/main.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<Offset>> _offsetAnimations;
  late List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // offset

    _offsetAnimations = List.generate(
      3,
      (index) => Tween(
        begin: Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * .33, 1, curve: Curves.easeOut),
        ),
      ),
    );

    // opacity

    _opacityAnimations = List.generate(
      3,
      (index) => Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * .33, 1, curve: Curves.easeOut),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const SizedBox(height: 50),
              FadeTransition(
                opacity: _opacityAnimations.first,
                child: SlideTransition(
                  position: _offsetAnimations[0],
                  child: const Text(
                    'About US',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _opacityAnimations[1],
                child: SlideTransition(
                  position: _offsetAnimations[1],
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 10, left: 10),
                    child: Image.asset('assets/ss.png'),
                  ),
                ),
              ),
              Expanded(
                child: FadeTransition(
                  opacity: _opacityAnimations.last,
                  child: SlideTransition(
                    position: _offsetAnimations[2],
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 60, right: 10, left: 10),
                      child: Text(
                        'A young and dynamic team capable of reliably meeting all your expectations with the sole aim of helping you achieve your goals by prioritizing the promotion of your brand.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
     
    );
  }
}
