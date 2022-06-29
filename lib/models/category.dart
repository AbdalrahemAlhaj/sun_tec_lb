import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Category{
  late String parentId;
  late String catId;
  late String catName;
  late String catImage;

  Category({
    required this.parentId,
    required this.catId,
    required this.catName,
    required this.catImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}