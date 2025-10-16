import 'package:flutter/material.dart';
import 'package:frames_design/Features/cart/product_detail_screen.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:frames_design/provider/product_provider.dart';
import 'package:frames_design/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';

class ProductCardVertical extends StatelessWidget {
  final Product product; // pass the full product object

  const ProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return GestureDetector(
      onTap: () {
      // print("something is happaning");
        Get.to(() => ProductDetailScreen(), transition: Transition.rightToLeft);
        // Named Route
        GetPage(
          name: "/product_detail",
          page: () => ProductDetailScreen(),
          transition: Transition.rightToLeft,
        );
      },

      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(OkSizes.md),
        ),
        child: Stack(
          children: [
            // Product Image
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                product.thumbnail,
                width: 330,
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: OkColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      product.isFavorite ? Iconsax.heart5 : Iconsax.heart,
                    ),
                    color: product.isFavorite
                        ? Colors.pinkAccent
                        : OkColors.textSecondary,
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    onPressed: () {
                      productProvider.toggleFavorite(product.id);
                    },
                  ),
                ],
              ),
            ),

            // Price & Cut Price
            Positioned(
              bottom: 12,
              left: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.cutPrice,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: OkColors.textPrimary,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),

                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: OkColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
