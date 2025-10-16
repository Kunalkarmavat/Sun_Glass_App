// import 'dart:convert';
// import 'package:frames_design/model/product.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   Future<List<Product>> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://dummyjson.com/products'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List productsJson = data['products'];
//       return productsJson.map((json) => Product.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }
