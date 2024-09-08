import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/repository/product_repo.dart';

class UpdateProduct {
  final ProductRepo prodRepo;
  UpdateProduct(this.prodRepo);

  Future<void> call(Product product) {
    return prodRepo.updateProduct(product);
  }
}
