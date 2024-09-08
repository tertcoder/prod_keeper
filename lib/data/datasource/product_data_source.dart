import 'package:isar/isar.dart';
import 'package:prod_keeper/data/model/product_model.dart';

class ProductDataSource {
  final Isar isar;
  ProductDataSource(this.isar);

  Future<List<ProductModel>> getAllProducts() async {
    return isar.productModels.where().findAll();
  }

  Future<void> addProduct(ProductModel product) async {
    await isar.writeTxn(() async {
      await isar.productModels.put(product);
    });
  }

  Future<void> updateProduct(ProductModel product) async {
    await isar.writeTxn(() async {
      await isar.productModels.put(product);
    });
  }

  Future<void> deleteProduct(ProductModel product) async {
    await isar.writeTxn(() async {
      await isar.productModels.put(product);
    });
    // await isar.writeTxn(() async {
    //   await isar.productModels.delete(id);
    // });
  }
}
