import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:on_market_challenge/data/models/product/product.dart';

@injectable
class ProductRepository {
  final ref = FirebaseFirestore.instance.collection('/product_list');

  Stream<List<QueryDocumentSnapshot<Product>>> getProducts() async* {
    yield* ref
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
          toFirestore: (meal, _) => {},
        )
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }
}
