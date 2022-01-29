import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';
import 'package:on_market_challenge/data/models/product/product.dart';

class DetailsSheet extends StatelessWidget {
  const DetailsSheet({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 0.8.sh,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: '${product.img}',
            fit: BoxFit.cover,
            width: 1.sw,
            height: 150.h,
            errorWidget: (context, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                Icon(
                  Icons.error,
                  color: Colors.grey,
                ),
                Text('not found'),
              ],
            ),
            fadeInCurve: Curves.linear,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.name}'),
                SizedBox(height: 16.h),
                Text('${product.description}'),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text('${product.price}'),
                    SizedBox(height: 16.h),
                    if (product.hasDiscount ?? false)
                      Text(' and discount price is ${product.discountedPrice}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<BasketBloc>().add(RemoveItem(product));
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.greenAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<BasketBloc>().add(AddItem(product));
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
