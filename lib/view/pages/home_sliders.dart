import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innotech/view/controllers/page_view_controller.dart';
import 'package:innotech/view/pages/aboutus_screen.dart';
import 'package:innotech/view/pages/contact_screen.dart';
import 'package:innotech/view/pages/home_screen.dart';
import 'package:innotech/view/pages/services_screen.dart';
import 'package:innotech/view/pallets/colors.dart';
import 'package:innotech/view/widgets/contact_item.dart';
import 'package:innotech/view/widgets/services_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlidingPageViwController>(
      builder: (controller) => SafeArea(
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
              PageView(
                controller: controller.pageController,
                children: <Widget>[
                  HomeScreen(),
                  const AboutUsScreen(),
                  ServicesScreen(
                    services: [
                      ServicesItem(
                          icon: Image.asset('assets/phone.png'),
                          label: 'MOBILE DEV'),
                      ServicesItem(
                          icon: Image.asset('assets/webdev.png'),
                          label: 'WEB DEV'),
                      ServicesItem(
                          icon: Image.asset('assets/uiux.png'),
                          label: 'UI UX DESIGN'),
                      ServicesItem(
                          icon: Image.asset('assets/videoediting.png'),
                          label: 'VIDEO EDITING'),
                      ServicesItem(
                          icon: Image.asset('assets/graphicdesign.png'),
                          label: 'GRAPHIC DESIGN'),
                      ServicesItem(
                          icon: Image.asset('assets/marketing.png'),
                          label: 'MARKETING'),
                    ],
                  ),
                  ContactScreen(
                    contacts: [
                      GestureDetector(
                        onTap: () => launchEmail('info@dev.dev.dz'),
                        child: ContactItem(
                            icon: Image.asset('assets/mail.png'),
                            label: 'EMAIL',
                            value: 'info@dev.dev.dz'),
                      ),
                      GestureDetector(
                        onTap: () => launchPhoneDialer('+213-777-11-2233'),
                        child: ContactItem(
                            icon: Image.asset('assets/call.png'),
                            label: 'PHONE',
                            value: '+213 777 11 22 33'),
                      ),
                      ContactItem(
                          icon: Image.asset('assets/location.png'),
                          label: 'ADDRESS',
                          value: 'Alger, Algeria'),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 4,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
                      dotColor: Colors.grey,
                      activeDotColor: primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch phone dialer
  Future<void> launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

// Function to launch email app
  Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
