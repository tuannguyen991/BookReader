import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default('') String id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String userName,
    @Default('') String password,
    @Default('') String email,
    @Default('') String phone,
    @Default(0) int age,
    @Default(false) bool gender,
    @Default('') String imageLink,
    @Default('') String imagaLinkRanking,
    @Default(0) int readingTime,
    @Default(0) int readBooks,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
