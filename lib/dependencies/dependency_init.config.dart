// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../blocs/basket/basket_bloc.dart' as _i4;
import '../blocs/bloc_observer.dart' as _i3;
import '../blocs/products_bloc/product_bloc.dart' as _i6;
import '../data/repositories/product_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppBlocObserver>(_i3.AppBlocObserver());
  gh.factory<_i4.BasketBloc>(() => _i4.BasketBloc());
  gh.factory<_i5.ProductRepository>(() => _i5.ProductRepository());
  gh.factory<_i6.ProductsBloc>(
      () => _i6.ProductsBloc(get<_i5.ProductRepository>()));
  return get;
}
