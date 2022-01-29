import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/products_bloc/product_bloc.dart';
import 'package:on_market_challenge/dependencies/dependency_init.dart';
import 'package:on_market_challenge/presentation/screens/home/product_list_widget.dart';
import 'package:on_market_challenge/presentation/widgets/cart_icon_badge.dart';
import 'package:on_market_challenge/utils/app_routes_name.dart';

const categoryList = ['Top Rated', 'Most Selling', 'Recently viewed'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutesName.cart),
                icon: const CartBadgeWidget())
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: categoryList
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoadedSuccess) {
                final products = state.productList;
                return TabBarView(
                  children: [
                    RestaurantListWidget(
                      restaurants: products,
                      category: productCategory.mostSelling,
                    ),
                    RestaurantListWidget(
                      restaurants: products,
                      category: productCategory.recentlyViewed,
                    ),
                    RestaurantListWidget(
                      restaurants: products,
                      category: productCategory.topRated,
                    ),
                  ],
                  controller: _tabController,
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
