import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.freezed.dart';
part 'create_user_model.g.dart';

@freezed
class CreateUserModel with _$CreateUserModel {
  const factory CreateUserModel({
    @Default('') String id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String birthDate,
  }) = _CreateUserModel;

  factory CreateUserModel.fromJson(Map<String, Object?> json) =>
      _$CreateUserModelFromJson(json);
}
