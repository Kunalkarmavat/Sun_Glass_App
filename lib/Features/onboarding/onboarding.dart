import 'package:flutter/material.dart';
import 'package:frames_design/Features/home/home_screen.dart';
import 'package:frames_design/navigation_menu.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 226, 222),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              'assets/images/onboarding/GirlPic2.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            left: 32,
            top: 54,
            child: Text(
              'The \nFuture \nLooks \nBright',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                fontSize: 70,
                fontWeight: FontWeight.w800,
                height: 1,
                color: Color(0xFF112616),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 34,
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => NavigationMenu(),
                    transition: Transition.rightToLeft,
                  );
                  // Named Route
                  GetPage(
                    name: "/next_Screen",
                    page: () => NavigationMenu(),
                    transition: Transition.rightToLeft,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                  backgroundColor: Color(0xFF112616),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                ),
                child: Text(
                  'Go Shopping',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: OkColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
