import 'package:prod_keeper/data/datasource/product_data_source.dart';
import 'package:prod_keeper/data/model/product_model.dart';
import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/repository/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSource dataSource;
  ProductRepoImpl(this.dataSource);

  @override
  Future<void> addProduct(Product product) {
    return dataSource.addProduct(
      ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        isDeleted: product.isDeleted,
      ),
    );
  }

  @override
  Future<void> deleteProduct(Product product) {
    return dataSource.updateProduct(
      ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        isDeleted: product.isDeleted,
      ),
    );
    // return dataSource.deleteProduct(id);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return dataSource.getAllProducts();
  }

  @override
  Future<void> updateProduct(Product product) {
    return dataSource.updateProduct(
      ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        isDeleted: product.isDeleted,
      ),
    );
  }
}
