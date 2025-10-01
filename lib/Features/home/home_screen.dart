import 'package:flutter/material.dart';
import 'package:frames_design/Features/home/widgets/header_section.dart';
import 'package:frames_design/Features/home/widgets/product_card.dart';
import 'package:frames_design/Features/home/widgets/search_bar.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:frames_design/utils/device/device_utility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: OkDeviceUtils.getAppBarHeight()),
              HeaderSection(), // your header
              SizedBox(height: OkSizes.spaceBtwSections),
              SearchBarContainer(),

              SizedBox(height: OkSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: OkSizes.defaultSpace,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
              
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return ProductCardVertical();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
