import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/repository/product_repo.dart';

class AddProduct {
  final ProductRepo prodRepo;
  AddProduct(this.prodRepo);

  Future<void> call(Product product) {
    return prodRepo.addProduct(product);
  }
}
