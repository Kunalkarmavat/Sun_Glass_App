import 'package:flutter/material.dart';
import 'package:frames_design/common/product/product.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EAE7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose Your Color',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                // Sunglasses Image
                Center(
                  child: OkRoundedImage(
                    imageUrl: 'assets/images/categories/ProductImg.png',
                    height: 482,
                    applyImageRadius: false,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // Bottom Floating Product Card
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomProductCard(),
          ),
        ],
      ),
    );
  }
}

class BottomProductCard extends StatelessWidget {
  const BottomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 26, 24, 22),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title/Price/Code row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eclipse V2',
                        style: GoogleFonts.montserrat(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF112616),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$165.00',
                            style: GoogleFonts.montserrat(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF112616),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '\$200.00',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF112616),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7EAE6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'ER02542',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF112616),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Info row (fixed)
            SizedBox(
              height: 50, // Ensures VerticalDivider is visible
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _InfoColumn(label: "Height:", value: "4 cm"),
                  VerticalDivider(
                    color: OkColors.darkGrey,
                    thickness: 2,
                    width: 20,
                  ),
                  _InfoColumn(label: "Width:", value: "15 cm"),
                  VerticalDivider(
                    color: OkColors.darkGrey,
                    thickness: 2,
                    width: 20,
                  ),
                  _InfoColumn(
                    label: "Material:",
                    value: "Glass",
                    valueColor: Color(0xFF112616),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Add to Cart Button
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF253C28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for info columns
class _InfoColumn extends StatelessWidget {
  final String label, value;
  final Color? valueColor;

  const _InfoColumn({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: valueColor ?? Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
