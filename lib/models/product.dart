import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Product{
  late String productId;
  late String productName;
  late String productShortdesc;
  late String productDesc;
  late int productPrice;
  late List<String> productImages;

  Product({
    required this.productId,
    required this.productName,
    required this.productShortdesc,
    required this.productDesc,
    required this.productPrice,
    required this.productImages,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}