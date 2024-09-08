import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/repository/product_repo.dart';

class GetAllProducts {
  final ProductRepo prodRepo;
  GetAllProducts(this.prodRepo);

  Future<List<Product>> call() {
    return prodRepo.getAllProducts();
  }
}
