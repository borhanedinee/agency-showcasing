import 'package:flutter/material.dart';
import 'package:innotech/main.dart';
import 'package:innotech/view/widgets/contact_item.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.contacts});

  final List<Widget> contacts;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<Offset>> _animations;

  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animations = List.generate(
      widget.contacts.length,
      (index) => Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * (1 / widget.contacts.length), 1,
              curve: Curves.easeOut),
        ),
      ),
    );

    // opacity

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.6, 1, curve: Curves.easeOut),
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
                opacity: _opacityAnimation,
                child: const Text(
                  'Contact US',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: List.generate(
                      widget.contacts.length,
                      (index) => SlideTransition(
                        position: _animations[index],
                        child: widget.contacts[index],
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
