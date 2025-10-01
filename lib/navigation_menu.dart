import 'package:flutter/material.dart';
import 'package:frames_design/Features/home/home_screen.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



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
              top: BorderSide(color: Colors.grey, width: 0.5), // 🔹 top border
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
                const TextStyle(
                  fontSize: 10,   // 🔹 decreased label font size
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            child: NavigationBar(
              backgroundColor: OkColors.white,
              indicatorColor: OkColors.softGrey,
              height: 70,
              elevation: 0, 
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (int index) {
                controller.selectedIndex.value = index;
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.menu, size: OkSizes.iconMd),
                  label: 'Menu',
                ),
               
                Center(
                  child: Text(
                                'Luxora',
                                style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF1C4322),
                                ),
                              ),
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shopping_bag, size: OkSizes.iconMd),
                  label: 'Account',
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
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    // Container(color: Colors.blue),
    // Container(color: Colors.green),
  ];
}
