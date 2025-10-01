import 'package:flutter/material.dart';
import 'package:frames_design/common/product/product.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        color: OkColors.cardBackgroundColor,

        borderRadius: BorderRadius.circular(OkSizes.md),
      ),
      child: Stack(
        children: [
          OkRoundedImage(
            imageUrl: 'assets/images/categories/image1.png',
            width: double.infinity,
            height: 212,
      
            applyImageRadius: false,
          ),
          // Wishlist Icon (smaller width)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hyper",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
      
                IconButton(
                  
                      color: OkColors.borderDark,
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      icon: Icon(Iconsax.heart),
                      onPressed: () {},
                    ),
              ],
            ),
          ),
      
      
            Positioned(
              bottom: 12,
              left: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                                // Title
                                          
                                // Price Row
                                Text(
                                  "₹98",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                          
                                Text(
                                  "₹98",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    fontFamily: 'Poppins'
                                    
                                  ),
                                  
                                ),
                                          
                                // Free delivery
                ],
              ),
            ),
        ],
      ),
    );
  }
}
