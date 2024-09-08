class Product {
  int id;
  String title;
  double price;
  String image;
  bool isDeleted;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.isDeleted = false,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
    bool? isDeleted,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
