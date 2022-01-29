import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';
import 'package:on_market_challenge/data/models/basket_model.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if (state is BasketLoaded && state.basket.items.isNotEmpty) {
            final items = state.basket.items;
            return ListView.builder(
              itemCount:
                  state.basket.itemQuantity(state.basket.items).keys.length,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              itemBuilder: (context, index) {
                return _CartItemWidget(
                  basket: state.basket,
                  index: index,
                );
              },
            );
          } else if (state is BasketLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox(
              child: Center(
                child: Text('no item added'),
              ),
            );
          }
        },
      ),
    );
  }
}

class _CartItemWidget extends StatelessWidget {
  const _CartItemWidget({Key? key, required this.basket, required this.index})
      : super(key: key);

  final Basket basket;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          context
              .read<BasketBloc>()
              .add(RemoveItem(basket.items.elementAt(index)));
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${basket.itemQuantity(basket.items).entries.elementAt(index).value}x',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                '${basket.itemQuantity(basket.items).keys.elementAt(index).name}',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Text(
              '\$${basket.itemQuantity(basket.items).keys.elementAt(index).price}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
