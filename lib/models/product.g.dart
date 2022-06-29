// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productShortdesc: json['product_shortdesc'] as String,
      productDesc: json['product_desc'] as String,
      productPrice: json['product_price'] as int,
      productImages: (json['product_images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_shortdesc': instance.productShortdesc,
      'product_desc': instance.productDesc,
      'product_price': instance.productPrice,
      'product_images': instance.productImages,
    };
