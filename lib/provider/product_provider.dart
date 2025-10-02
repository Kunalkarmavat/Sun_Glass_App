import 'package:flutter/material.dart';
import 'package:frames_design/model/api_service.dart';
import 'package:frames_design/model/product.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  double _maxPrice = 100;
  double get maxPrice => _maxPrice;

  List<Product> get filteredProducts => _filteredProducts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await apiService.fetchProducts();
      _filteredProducts = List.from(_products);
    } catch (e) {
      _products = [];
      _filteredProducts = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void filterByMaxPrice(double maxPrice) {
    _maxPrice = maxPrice;
    _filteredProducts = _products.where((p) => p.price <= maxPrice).toList();
    notifyListeners();
  }

  void filterBySearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) {
      _filteredProducts = List.from(_products);
    } else {
      _filteredProducts = _products.where((p) => p.title.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    }
    notifyListeners();
  }

  void clearFilter() {
    _maxPrice = 100;
    _filteredProducts = List.from(_products);
    notifyListeners();
  }
}
