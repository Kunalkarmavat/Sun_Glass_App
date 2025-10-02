import 'package:flutter/material.dart';
import 'package:frames_design/common/product/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 241, 238),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Choose Your Color',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
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
          // Main scrollable content (add your desired widgets here)
          SingleChildScrollView(
            child: Column(
              children: [
                // Sunglasses Image
                Center(
                  child: OkRoundedImage(
                    imageUrl: 'assets/images/categories/ProductImg.png',
                    height: 470,
                    
                    applyImageRadius: false,
                  ),
                ),
                const SizedBox(height: 8),
                // ... add thumbnails or any other content here ...
              ],
            ),
          ),
          // Bottom Floating Product Card
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15), // Outer padding from device edge
              child: BottomProductCard(),
            ),
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
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
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
                      const Text(
                        'Eclipse V2',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '\$165.00',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF112616),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '\$200.00',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFE7EAE6),
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
            // Info row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoColumn(label: "Height:", value: "4 cm"),
                _InfoColumn(label: "Width:", value: "15 cm"),
                _InfoColumn(label: "Material:", value: "Glass", valueColor: Color(0xFF112616)),
              ],
            ),
            const SizedBox(height: 22),
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF253C28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 17),
                ),
                onPressed: () {},
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
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

// Helper widget for the info columns
class _InfoColumn extends StatelessWidget {
  final String label, value;
  final Color? valueColor;

  const _InfoColumn({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: TextStyle(color: Colors.grey, fontSize: 16)),
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
      ),
    );
  }
}
