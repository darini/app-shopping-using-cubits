// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'] as String?,
      image: json['image'] as String?,
      role: json['role'] as String?,
      token: json['token'] as String?,
    )
      ..username = json['username'] as String?
      ..password = json['password'] as String?
      ..name = json['name'] as String?
      ..email = json['email'] as String?;

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'image': instance.image,
      'role': instance.role,
      'token': instance.token,
    };
