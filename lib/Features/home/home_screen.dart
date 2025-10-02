import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frames_design/features/home/widgets/header_section.dart';
import 'package:frames_design/features/home/widgets/search_bar.dart';
import 'package:frames_design/provider/product_provider.dart';
import 'package:frames_design/features/home/widgets/product_card.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:frames_design/utils/device/device_utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categoryImageList = [
    'assets/images/categories/image1.png',
    'assets/images/categories/image2.png',
    'assets/images/categories/image3.png',
    'assets/images/categories/image4.png',
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: productProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: OkDeviceUtils.getAppBarHeight()),
                    const HeaderSection(),
                    SizedBox(height: OkSizes.spaceBtwSections),
                    SearchBarContainer(
                      onSearchChanged: (searchTerm) {
                        Provider.of<ProductProvider>(context, listen: false).filterBySearchTerm(searchTerm);
                      },
                    ),
                    SizedBox(height: OkSizes.spaceBtwSections),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: OkSizes.defaultSpace),
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
                        itemCount: productProvider.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = productProvider.filteredProducts[index];
                          return ProductCardVertical(
                            title: product.title,
                            price: product.price,
                            imageUrl: categoryImageList[index % categoryImageList.length],
                          );
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
