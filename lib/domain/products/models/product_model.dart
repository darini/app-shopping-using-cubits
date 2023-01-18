import 'package:json_annotation/json_annotation.dart';
import 'package:shopping2/domain/categories/models/category_model.dart';

part 'product_model.g.dart';

abstract class ProductModelKeys {
  static const id = 'id';
  static const title = 'title';
  static const tag = 'tag';
  static const price = 'price';
  static const description = 'description';
  static const brand = 'brand';
  static const images = 'images';
  static const image = 'image';
  static const category = 'category';
}

@JsonSerializable()
class ProductModel {
  @JsonKey(name: ProductModelKeys.id, required: true)
  String? id;

  @JsonKey(name: ProductModelKeys.title, required: true)
  String? title;

  @JsonKey(name: ProductModelKeys.tag, required: true)
  String? tag;

  @JsonKey(name: ProductModelKeys.price, required: true)
  double? price = 0;

  @JsonKey(name: ProductModelKeys.description)
  String? description;

  @JsonKey(name: ProductModelKeys.brand, required: true)
  String? brand;

  @JsonKey(name: ProductModelKeys.images)
  List<String?>? images;

  @JsonKey(name: ProductModelKeys.image)
  String? image;

  @JsonKey(name: ProductModelKeys.category)
  CategoryModel? category;

  ProductModel(
      {this.id,
      this.title,
      this.tag,
      this.price,
      this.description,
      this.brand,
      this.images,
      this.image,
      this.category});

  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
