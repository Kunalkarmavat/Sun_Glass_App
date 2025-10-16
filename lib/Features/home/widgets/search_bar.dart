import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:frames_design/utils/constants/sizes.dart';

class SearchBarContainer extends StatelessWidget {
  final Function(String) onSearchChanged;

  const SearchBarContainer({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: OkSizes.defaultSpace),
      padding: const EdgeInsets.symmetric(vertical: OkSizes.xs, horizontal: OkSizes.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        onChanged: onSearchChanged,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: "Search your Products",
          hintStyle: GoogleFonts.montserrat(fontSize: 16),
          prefixIcon: const Icon(Iconsax.search_normal, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
