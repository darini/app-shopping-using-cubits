import 'package:json_annotation/json_annotation.dart';
import 'package:shopping2/domain/account/models/authenticated_account_model.dart';

part 'create_account_model.g.dart';

abstract class CreateAccountModelKeys {
  static const name = 'name';
  static const email = 'email';
}

@JsonSerializable()
class CreateAccountModel extends AuthenticatedAccountModel {
  @JsonKey(name: CreateAccountModelKeys.name)
  String? name;

  @JsonKey(name: CreateAccountModelKeys.email)
  String? email;

  CreateAccountModel({this.name, this.email});

  factory CreateAccountModel.fromJson(json) =>
      _$CreateAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountModelToJson(this);
}
