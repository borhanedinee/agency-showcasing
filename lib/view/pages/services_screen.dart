import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innotech/main.dart';
import 'package:innotech/view/widgets/services_item.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.services});

  final List<Widget> services;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<double>> _scaleAnimations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _scaleAnimations = List.generate(
      widget.services.length,
      (index) => Tween(
        begin: 0.0,
        end: 1.1,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * (1 / widget.services.length), 1,
              curve: Curves.easeOut),
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
                opacity: _scaleAnimations.last,
                child: const Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: widget.services.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ScaleTransition(
                        scale: _scaleAnimations[index],
                        child: widget.services[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
