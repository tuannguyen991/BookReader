// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateUserModel _$$_UpdateUserModelFromJson(Map<String, dynamic> json) =>
    _$_UpdateUserModel(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_UpdateUserModelToJson(_$_UpdateUserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'birthDate': instance.birthDate,
    };
