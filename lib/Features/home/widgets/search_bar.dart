import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:frames_design/utils/constants/sizes.dart';

class SearchBarContainer extends StatefulWidget {
  final Function(String) onSearchChanged;

  const SearchBarContainer({super.key, required this.onSearchChanged});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarContainerState createState() => _SearchBarContainerState();
}

class _SearchBarContainerState extends State<SearchBarContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    widget.onSearchChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: OkSizes.defaultSpace),
      padding: const EdgeInsets.symmetric(vertical: OkSizes.xs, horizontal: OkSizes.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
      
        controller: _controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: "Search products...",
          prefixIcon: const Icon(Iconsax.search_normal,
          color:Colors.grey ,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
