// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      age: json['age'] as int,
      gender: json['gender'] as bool,
      imageLink: json['imageLink'] as String,
      imagaLinkRanking: json['imagaLinkRanking'] as String,
      readingTime: json['readingTime'] as int,
      readBooks: json['readBooks'] as int,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
      'age': instance.age,
      'gender': instance.gender,
      'imageLink': instance.imageLink,
      'imagaLinkRanking': instance.imagaLinkRanking,
      'readingTime': instance.readingTime,
      'readBooks': instance.readBooks,
    };
