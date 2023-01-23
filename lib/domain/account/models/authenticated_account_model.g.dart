// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedAccountModel _$AuthenticatedAccountModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedAccountModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthenticatedAccountModelToJson(
        AuthenticatedAccountModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
