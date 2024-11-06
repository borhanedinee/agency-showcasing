import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innotech/view/controllers/page_view_controller.dart';
import 'package:innotech/view/pages/animated_splash_screen.dart';
import 'package:innotech/view/pages/home_screen.dart';
import 'package:innotech/view/pages/home_sliders.dart';

late Size size;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        fontFamily: 'Montserrat'
      ),
      home: AnimatedSplashScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => SlidingPageViwController(), fenix: true);
      }),
    );
  }
}
