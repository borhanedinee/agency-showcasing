import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innotech/main.dart';
import 'package:innotech/view/controllers/page_view_controller.dart';
import 'package:innotech/view/pallets/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final SlidingPageViwController controller = Get.find();
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

    // offset animation
    _offsetAnimations = List.generate(4, (index) {
      return Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.25, 1, curve: Curves.easeOut),
        ),
      );
    });

    // opacity animation
    _opacityAnimations = List.generate(
        4,
        (index) => Tween<double>(
              begin: 0,
              end: 1,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(index * .25, 1, curve: Curves.easeOut),
              ),
            ));

    _controller.forward().then((value) => print('ccccccccccc'));
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
              FadeTransition(
                opacity: _opacityAnimations[0],
                child: SlideTransition(
                  position: _offsetAnimations[0],
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 80, right: 10, left: 10),
                    
                    child: const Center(
                      child: Text(
                        'InnoTech Solutions',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          letterSpacing: 3,
                          wordSpacing: 4,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo,),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  child: Column(
                    children: [
                      FadeTransition(
                        opacity: _opacityAnimations[1],
                        child: SlideTransition(
                          position: _offsetAnimations[1],
                          child: const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              'Creative Software Development and Strategy Agency',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _opacityAnimations[2],
                        child: SlideTransition(
                          position: _offsetAnimations[2],
                          child: const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              'The only strategic agency dedicated to software development for meaningful and visionary decisions.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _opacityAnimations[3],
                        child: SlideTransition(
                          position: _offsetAnimations[3],
                          child: Container(
                            margin: const EdgeInsets.only(top: 100),
                            width: size.width * .6,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.updateValue(3);
                                controller.update();
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Contact Us'.toUpperCase(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
