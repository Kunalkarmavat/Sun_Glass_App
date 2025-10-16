import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
                  style: GoogleFonts.poppins(
                    height: 0.9,
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                    letterSpacing: 2,
                    color: Color(0xFF112616),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'New \nArrivals',
                style: GoogleFonts.poppins(
                 height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Color(0xFF112616),
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
                            thumbColor: Color(0xFF1C4322),
                            activeColor: Color(0xFF1C4322),
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
                          child:  Text('Clear Filter'
                          ,style: GoogleFonts.montserrat(color: Color(0xFF1C4322),
                          
                          fontWeight: FontWeight.w500),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false).filterByMaxPrice(tempPrice);
                            Navigator.of(context).pop();
                          },
                           child:  Text('Apply'
                          ,style: GoogleFonts.montserrat(color: Color(0xFF1C4322),
                          
                          fontWeight: FontWeight.w500),
                          ),
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
