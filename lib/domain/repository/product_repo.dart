import 'package:prod_keeper/domain/entity/product.dart';

abstract interface class ProductRepo {
  Future<List<Product>> getAllProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(Product product);
  // Future<void> deleteProduct(int id);
}
