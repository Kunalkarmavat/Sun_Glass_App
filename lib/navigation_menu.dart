import 'package:flutter/material.dart';
import 'package:frames_design/Features/home/home_screen.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
                const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            child: NavigationBar(
              backgroundColor: OkColors.white,
              indicatorColor: OkColors.softGrey,
              indicatorShape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10),
              ),
              maintainBottomViewPadding: true,
              height: 70,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (int index) {
                controller.selectedIndex.value = index;
              },
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.drag_indicator, size: 28),
                  label: 'Menu',
                ),
                NavigationDestination(
                  
                  icon: Text(
                    'Luxora',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF112616),
                    ),
                  ),
                  selectedIcon: Text(
                    'Luxora',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: OkColors.textPrimary,
                    ),
                  ),
                  label: '',
                ),
                const NavigationDestination(
                  
                  icon: Icon(Icons.shopping_bag_outlined, size: 28),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
}
