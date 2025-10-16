import 'package:flutter/material.dart';
import 'package:frames_design/model/product.dart';

class ProductProvider extends ChangeNotifier {
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  double _maxPrice = 500; // set a large default max
  double get maxPrice => _maxPrice;

  final List<Product> _products = [
    Product(id: 1, title: 'Hyper', price: 99, cutPrice: "", thumbnail: 'assets/images/categories/image1.png'),
    Product(id: 2, title: 'Frame v1', price: 82, cutPrice: "\$99.50", thumbnail: 'assets/images/categories/image2.png'),
    Product(id: 3, title: 'Eclipse', price: 70, cutPrice: "\$86.00", thumbnail: 'assets/images/categories/image3.png'),
    Product(id: 4, title: 'Spectra', price: 54.50, cutPrice: "", thumbnail: 'assets/images/categories/image4.png'),
    Product(id: 5, title: 'Hyper', price: 99, cutPrice: "", thumbnail: 'assets/images/categories/image1.png'),
    Product(id: 6, title: 'Frame v1', price: 82, cutPrice: "", thumbnail: 'assets/images/categories/image2.png'),
    Product(id: 7, title: 'Eclipse', price: 70, cutPrice: "", thumbnail: 'assets/images/categories/image3.png'),
    Product(id: 8, title: 'Spectra', price: 54.50, cutPrice: "", thumbnail: 'assets/images/categories/image4.png'),
  ];

  late List<Product> _filteredProducts;

  List<Product> get filteredProducts => _filteredProducts;

  ProductProvider() {
    _filteredProducts = List.from(_products);
  }

  // 🔍 Search filter
  void filterBySearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) {
      _filteredProducts = List.from(_products);
    } else {
      _filteredProducts = _products
          .where((p) => p.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // 💰 Filter by max price
  void filterByMaxPrice(double maxPrice) {
    _maxPrice = maxPrice;
    _filteredProducts = _products.where((p) => p.price <= _maxPrice).toList();
    notifyListeners();
  }

  // 🔄 Clear filters
  void clearFilter() {
    _maxPrice = 500;
    _filteredProducts = List.from(_products);
    notifyListeners();
  }

  // ❤️ Toggle favorite
  void toggleFavorite(int productId) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _products[index].isFavorite = !_products[index].isFavorite;
      notifyListeners();
    }
  }
}
