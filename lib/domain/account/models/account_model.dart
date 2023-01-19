import 'package:json_annotation/json_annotation.dart';
import 'package:shopping2/domain/account/models/create_account_model.dart';

part 'account_model.g.dart';

abstract class AccountModelKeys {
  static const id = 'id';
  static const imagem = 'image';
  static const role = 'role';
  static const token = 'token';
}

@JsonSerializable()
class AccountModel extends CreateAccountModel {
  @JsonKey(name: AccountModelKeys.id)
  String? id = '';

  @JsonKey(name: AccountModelKeys.imagem)
  String? image;

  @JsonKey(name: AccountModelKeys.role)
  String? role;

  @JsonKey(name: AccountModelKeys.token)
  String? token;

  AccountModel({this.id, this.image, this.role, this.token});

  factory AccountModel.fromJson(json) => _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
