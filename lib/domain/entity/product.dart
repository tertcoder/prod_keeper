class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final bool isDeleted;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.isDeleted = false,
  });
}
