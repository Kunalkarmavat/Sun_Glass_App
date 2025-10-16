class Product {
  final int id;
  final String title;
  final double price;
  final String cutPrice;
  final String thumbnail;
  bool isFavorite; // for heart toggle

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    this.cutPrice = '',
    this.isFavorite = false,
  });
}
