import 'package:flutter/material.dart';
import 'package:frames_design/navigation_menu.dart';
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
                    // Header Section
                    const HeaderSection(),
                    SizedBox(height: OkSizes.spaceBtwSections),
                    
                    // Search Bar
                    SearchBarContainer(
                      onSearchChanged: (searchTerm) {
                        productProvider.filterBySearchTerm(searchTerm);
                      },
                    ),

                    SizedBox(height: OkSizes.spaceBtwItems),

                    // Product Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: OkSizes.defaultSpace),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: productProvider.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              productProvider.filteredProducts[index];
                          return ProductCardVertical(
                            product: product, // Pass the full product object
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
