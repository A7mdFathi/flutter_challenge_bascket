import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:on_market_challenge/data/models/product/product.dart';
import 'package:on_market_challenge/data/repositories/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  ProductsBloc(this.productsRepository) : super(ProductsInitial()) {
    on<ProductUpdated>(_mapMealsFetchedToState);
    _subscription = productsRepository.getProducts().listen((event) {
      debugPrint('new EVENTTTTT ${event.first.data().discountedPrice}');
      add(ProductUpdated(event));
    }, cancelOnError: false, onError: (e) => debugPrint(e));
  }

  final ProductRepository productsRepository;
  late StreamSubscription _subscription;

  _mapMealsFetchedToState(
      ProductUpdated event, Emitter<ProductsState> emit) async {
    emit(const ProductsInProgress());
    final List<Product> products =
        event.snapshots.map((e) => e.data()).toList();
    emit(ProductsLoadedSuccess(productList: products));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
