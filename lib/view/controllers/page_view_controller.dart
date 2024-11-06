import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidingPageViwController extends GetxController {
  
  PageController pageController = PageController(initialPage: 0);
  updateValue(value){
    pageController.animateToPage(value, duration: const Duration(milliseconds: 900), curve: Curves.bounceInOut);
  }
}