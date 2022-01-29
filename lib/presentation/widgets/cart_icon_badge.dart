import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';

class CartBadgeWidget extends StatelessWidget {
  const CartBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return Badge(
          child: const Icon(Icons.shopping_cart),
          badgeContent: state is BasketLoaded
              ? Text(
                  state.basket.items.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              : null,
          showBadge: state is BasketLoaded && state.basket.items.isNotEmpty,
        );
      },
    );
  }
}
