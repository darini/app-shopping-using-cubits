import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticated_account_model.g.dart';

abstract class AuthenticatedAccountModelKeys {
  static const username = 'username';
  static const password = 'password';
}

@JsonSerializable()
class AuthenticatedAccountModel {
  @JsonKey(name: AuthenticatedAccountModelKeys.username)
  String? username;

  @JsonKey(name: AuthenticatedAccountModelKeys.password)
  String? password;

  AuthenticatedAccountModel({this.username, this.password});

  factory AuthenticatedAccountModel.fromJson(json) =>
      _$AuthenticatedAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedAccountModelToJson(this);
}
