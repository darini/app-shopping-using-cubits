// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title', 'tag', 'price', 'brand'],
  );
  return ProductModel(
    id: json['id'] as String?,
    title: json['title'] as String?,
    tag: json['tag'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    brand: json['brand'] as String?,
    images:
        (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    image: json['image'] as String?,
    category: json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tag': instance.tag,
      'price': instance.price,
      'description': instance.description,
      'brand': instance.brand,
      'images': instance.images,
      'image': instance.image,
      'category': instance.category,
    };
