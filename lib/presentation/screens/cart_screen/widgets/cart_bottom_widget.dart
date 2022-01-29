import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';

class CartBottomWidget extends StatelessWidget {
  const CartBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 0.21.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            // horizontal: 12.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Divider(
                thickness: 1.0,
                color: Colors.blue,
              ),
              BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildRow(
                          text: 'subtotal',
                          num: state is BasketLoaded
                              ? state.basket.subtotalString
                              : ''),
                      buildRow(
                          text: 'total',
                          num: state is BasketLoaded
                              ? state.basket.totalString
                              : ''),
                    ],
                  );
                },
              ),
              Builder(
                builder: (context) {
                  final state = context.watch<BasketBloc>().state;
                  return ElevatedButton(
                      onPressed: () {
                        context.read<BasketBloc>().add(const ClearAllItem());
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Order Success check order list'),
                          backgroundColor: Colors.green,
                        ));
                      },
                      child: const Text('Checkout'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow({required String text, required String num}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
        ),
        Text(
          num,
        ),
      ],
    );
  }
}
