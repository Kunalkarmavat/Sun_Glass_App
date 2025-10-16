import 'package:flutter/material.dart';
import 'package:frames_design/Features/onboarding/onboarding.dart';
import 'package:get/route_manager.dart';
// Import your LoginScreen class here

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Color.fromARGB(255, 238, 241, 238),
        fontFamily: 'Sora', // Optional, use if you have Sora font set up
      ),
      home: OnboardingScreen(),
      
       // Change this to your initial screen
      

      
    );
  }
}
