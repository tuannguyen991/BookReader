// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      imageLink: json['imageLink'] as String? ?? '',
      totalReadingTime: json['totalReadingTime'] as int? ?? 0,
      ranking: $enumDecodeNullable(_$RankingEnumMap, json['ranking']) ??
          Ranking.bronze,
      currentPackage: json['currentPackage'] == null
          ? null
          : UserReadingPackageModel.fromJson(
              json['currentPackage'] as Map<String, dynamic>),
      recentlyHistories: (json['recentlyHistories'] as List<dynamic>?)
              ?.map((e) => UserHistoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalReadingBooks: json['totalReadingBooks'] as int? ?? 0,
      id: json['id'] as String? ?? '',
      recommendBooks: (json['recommendBooks'] as List<dynamic>?)
              ?.map((e) => UserBookModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastBook: json['lastBook'] == null
          ? const UserBookModel()
          : UserBookModel.fromJson(json['lastBook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'imageLink': instance.imageLink,
      'totalReadingTime': instance.totalReadingTime,
      'ranking': _$RankingEnumMap[instance.ranking]!,
      'currentPackage': instance.currentPackage,
      'recentlyHistories': instance.recentlyHistories,
      'totalReadingBooks': instance.totalReadingBooks,
      'id': instance.id,
      'recommendBooks': instance.recommendBooks,
      'lastBook': instance.lastBook,
    };

const _$RankingEnumMap = {
  Ranking.gold: 0,
  Ranking.silver: 1,
  Ranking.bronze: 2,
};
