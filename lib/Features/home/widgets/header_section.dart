
import 'package:flutter/material.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: OkSizes.defaultSpace),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
        children: [
      Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Text(
          '16',
          style: TextStyle(
            fontFamily: 'Sora',
            height: 0.9,
            fontWeight: FontWeight.w800,
            fontSize: 80,
            letterSpacing: -12,
            color: OkColors.textPrimary,
            
          ),
        ),
      ),
      
      const SizedBox(width: 8), // spacing
      Text(
        'New \nArrivals',
        style: TextStyle(
          fontFamily: 'Sora',
          height: 1,
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: OkColors.textPrimary,
        ),
      ),
        ],
      ),
      
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
             
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFF1C4322),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
