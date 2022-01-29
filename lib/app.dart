import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_market_challenge/blocs/basket/basket_bloc.dart';

import 'utils/app_routes.dart';
import 'utils/app_routes_name.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({
    Key? key,
    required this.cartBloc,
  }) : super(key: key);

  final BasketBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cartBloc..add(StartBasket()),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 730.0),
      builder: () => const MaterialApp(
        initialRoute: AppRoutesName.home,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
