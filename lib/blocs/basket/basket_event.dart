part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final Product item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItem extends BasketEvent {
  final Product item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

class ClearAllItem extends BasketEvent {
  const ClearAllItem();

  @override
  List<Object> get props => [];
}

class RemoveAllItem extends BasketEvent {
  final Product item;

  const RemoveAllItem(this.item);

  @override
  List<Object> get props => [item];
}
