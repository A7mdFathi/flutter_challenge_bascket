import 'package:equatable/equatable.dart';
import 'package:on_market_challenge/data/models/product/product.dart';

class Basket extends Equatable {
  final List<Product> items;

  const Basket({
    this.items = const <Product>[],
  });

  Basket copyWith({
    List<Product>? items,
  }) {
    return Basket(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [
        items,
      ];

  Map itemQuantity(items) {
    var quantity = Map();

    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0.0, (total, current) => total + current.price!);

  double total(subtotal) {
    return subtotal + 5;
  }

  String get subtotalString => subtotal.toString();

  String get totalString => total(subtotal).toString();
}
