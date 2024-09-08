import 'package:isar/isar.dart';
import 'package:prod_keeper/domain/entity/product.dart';

part 'product_model.g.dart';

@collection
class ProductModel extends Product {
  @override
  Id id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String image;
  @override
  final bool isDeleted;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
    this.id = Isar.autoIncrement,
    this.isDeleted = false,
  }) : super(
          id: id,
          title: title,
          price: price,
          image: image,
          isDeleted: isDeleted,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      isDeleted: json['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'isDeleted': isDeleted
    };
  }
}
