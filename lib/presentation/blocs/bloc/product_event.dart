part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class AddNewProduct extends ProductEvent {
  final Product product;
  const AddNewProduct(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateExistingProduct extends ProductEvent {
  final Product product;
  const UpdateExistingProduct(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteExistingProduct extends ProductEvent {
  final Product product;
  const DeleteExistingProduct(this.product);

  @override
  List<Object> get props => [product];
}
