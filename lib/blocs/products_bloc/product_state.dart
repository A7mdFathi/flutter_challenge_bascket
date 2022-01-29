part of 'product_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsInProgress extends ProductsState {
  const ProductsInProgress();

  @override
  List<Object> get props => [];
}

class ProductsLoadedSuccess extends ProductsState {
  final List<Product> productList;

  const ProductsLoadedSuccess({required this.productList});

  @override
  List<Object> get props => [productList];
}

class ProductsFailure extends ProductsState {
  final String message;

  @override
  List<Object> get props => [message];

  const ProductsFailure(this.message);
}
