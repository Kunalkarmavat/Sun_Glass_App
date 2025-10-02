import 'package:flutter/material.dart';
import 'package:frames_design/common/product/product.dart';
import 'package:iconsax/iconsax.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';

class ProductCardVertical extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  const ProductCardVertical({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(OkSizes.md),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child:OkRoundedImage(
              imageUrl: 'assets/images/categories/image1.png',
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
              applyImageRadius: false,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.heart),
                  color: OkColors.borderDark,
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              '₹${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
