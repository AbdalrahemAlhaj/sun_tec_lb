// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      parentId: json['parent_id'] as String,
      catId: json['cat_id'] as String,
      catName: json['cat_name'] as String,
      catImage: json['cat_image'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'parent_id': instance.parentId,
      'cat_id': instance.catId,
      'cat_name': instance.catName,
      'cat_image': instance.catImage,
    };
