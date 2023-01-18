import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

abstract class CategoryModelKeys {
  static const id = 'id';
  static const title = 'title';
  static const tag = 'tag';
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: CategoryModelKeys.id, required: true)
  String? id;

  @JsonKey(name: CategoryModelKeys.title, required: true)
  String? title;

  @JsonKey(name: CategoryModelKeys.tag, required: true)
  String? tag;

  CategoryModel({this.id, this.title, this.tag});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic>? toJson() => _$CategoryModelToJson(this);
}
