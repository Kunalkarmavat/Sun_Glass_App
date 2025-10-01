import 'package:flutter/material.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: OkSizes.defaultSpace),
      padding: const EdgeInsets.symmetric(vertical: OkSizes.xs,horizontal: OkSizes.sm),

      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // optional for rounded edges
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search products...",
          prefixIcon: Icon(Iconsax.search_normal, ),
          border: InputBorder.none, // 
        ),
      ),
    );
  }
}
