import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/repository/product_repo.dart';

class DeleteProduct {
  final ProductRepo prodRepo;
  DeleteProduct(this.prodRepo);

  Future<void> call(Product product) {
    return prodRepo.deleteProduct(product);
  }
}
