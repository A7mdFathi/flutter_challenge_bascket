import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(createToJson: false)
class Product extends Equatable {
  const Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discountedPrice,
    this.hasDiscount,
    this.img,
    this.categoryId,
  });

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'img')
  final String? img;
  @JsonKey(name: 'desc')
  final String? description;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'discounted_price')
  final double? discountedPrice;
  @JsonKey(name: 'has_discount')
  final bool? hasDiscount;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discountedPrice,
        hasDiscount,
        img,
        categoryId,
      ];

  factory Product.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

// Map<String, dynamic> toJson() => _$MealToJson(this);
}
