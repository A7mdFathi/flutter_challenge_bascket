part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductUpdated extends ProductEvent {
  final List<QueryDocumentSnapshot<Product>> snapshots;

  const ProductUpdated(this.snapshots);

  @override
  List<Object> get props => [snapshots];
}
