import 'package:flutter/material.dart';
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
          Image.asset(
            'assets/images/onboarding/GirlPic2.png',
            fit: BoxFit.cover,
          ),

          // Heading Text
       
Positioned(
  left: 12,
  top: 54,
  child: Text(
    'The \nFuture \nLooks \nBright',
    textAlign: TextAlign.left,
    style: GoogleFonts.poppins(
      fontSize: 70,
      fontWeight: FontWeight.bold,
      height: 1,
    ),
  ),
),
          // Only the Button at Bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => NavigationMenu());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  elevation: 0,
                  backgroundColor: OkColors.dark,
                  padding: const EdgeInsets.all(18),
                ),
                child: Text(
                  'Go Shopping',
                  style: TextStyle(color: OkColors.textWhite),
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
