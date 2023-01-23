// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountModel _$CreateAccountModelFromJson(Map<String, dynamic> json) =>
    CreateAccountModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
    )
      ..username = json['username'] as String?
      ..password = json['password'] as String?;

Map<String, dynamic> _$CreateAccountModelToJson(CreateAccountModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'email': instance.email,
    };
