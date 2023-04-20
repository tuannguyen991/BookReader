import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_model.freezed.dart';
part 'update_user_model.g.dart';

@freezed
class UpdateUserModel with _$UpdateUserModel {
  const factory UpdateUserModel({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String birthDate,
  }) = _UpdateUserModel;

  factory UpdateUserModel.fromJson(Map<String, Object?> json) =>
      _$UpdateUserModelFromJson(json);
}
