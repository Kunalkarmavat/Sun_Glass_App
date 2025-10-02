import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frames_design/utils/constants/colors.dart';
import 'package:frames_design/utils/constants/sizes.dart';
import 'package:frames_design/provider/product_provider.dart';

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
              const SizedBox(width: 8),
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
          GestureDetector(
            onTap: () {
              double selectedMaxPrice = Provider.of<ProductProvider>(context, listen: false).maxPrice;
              showDialog(
                context: context,
                builder: (context) {
                  double tempPrice = selectedMaxPrice;
                  return StatefulBuilder(
                    builder: (context, setStateDialog) => AlertDialog(
                      title: const Text('Filter by Max Price'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Max Price: ₹${tempPrice.toStringAsFixed(0)}'),
                          Slider(
                            min: 0,
                            max: 500,
                            divisions: 50,
                            value: tempPrice,
                            label: tempPrice.toStringAsFixed(0),
                            onChanged: (value) {
                              setStateDialog(() {
                                tempPrice = value;
                              });
                            },
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false).clearFilter();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Clear Filter'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false).filterByMaxPrice(tempPrice);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Apply'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.filter_alt_outlined,
                color: Color(0xFF1C4322),
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
