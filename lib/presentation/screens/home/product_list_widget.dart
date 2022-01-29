import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';
import 'package:on_market_challenge/blocs/products_bloc/product_bloc.dart';
import 'package:on_market_challenge/data/models/product/product.dart';

import 'details_sheet.dart';

enum productCategory { topRated, mostSelling, recentlyViewed }

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    Key? key,
    // required this.restaurants,
    required this.category,
  }) : super(key: key);

  // final List<Product> restaurants;
  final productCategory category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedSuccess) {
          //load data based on category
          final products = state.productList.where((element) {
            debugPrint('${category.index} ${element.categoryId}');
            return element.categoryId == category.index.toString();
          }).toList();
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context, index) => RestaurantViewItem(
              index: index,
              restaurant: products[index],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class RestaurantViewItem extends StatelessWidget {
  const RestaurantViewItem({
    Key? key,
    required this.index,
    required this.restaurant,
  }) : super(key: key);
  final int index;
  final Product restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (_) {
            return DetailsSheet(product: restaurant);
          },
        );
      },
      title: Text('${restaurant.name}'),
      subtitle: Text('${restaurant.description}'),
      dense: true,
      trailing: SizedBox(
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  context.read<BasketBloc>().add(RemoveItem(restaurant));
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.greenAccent,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<BasketBloc>().add(AddItem(restaurant));
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          )),
    );
  }
}
