import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/domain/usecases/add_product.dart';
import 'package:prod_keeper/domain/usecases/delete_product.dart';
import 'package:prod_keeper/domain/usecases/get_all_products.dart';
import 'package:prod_keeper/domain/usecases/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final AddProduct addProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  ProductBloc(
    this.getAllProducts,
    this.addProduct,
    this.updateProduct,
    this.deleteProduct,
  ) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getAllProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(const ProductError("Failed to load products"));
      }
    });

    on<AddNewProduct>((event, emit) async {
      try {
        await addProduct(event.product);
        add(LoadProducts());
      } catch (e) {
        emit(const ProductError("Failed to add product"));
      }
    });
    on<UpdateExistingProduct>((event, emit) async {
      try {
        await updateProduct(event.product);
        add(LoadProducts());
      } catch (e) {
        emit(const ProductError("Failed to update product"));
      }
    });
    on<DeleteExistingProduct>((event, emit) async {
      try {
        await deleteProduct(event.product);
        add(LoadProducts());
      } catch (e) {
        emit(const ProductError("Failed to delete product"));
      }
    });
  }
}
