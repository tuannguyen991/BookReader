import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_reading_package_model.freezed.dart';
part 'user_reading_package_model.g.dart';

@freezed
class UserReadingPackageModel with _$UserReadingPackageModel {
  const factory UserReadingPackageModel({
    @Default('') String readingPackageId,
    DateTime? startDate,
    DateTime? endDate,
  }) = _UserReadingPackageModel;

  factory UserReadingPackageModel.fromJson(Map<String, Object?> json) =>
      _$UserReadingPackageModelFromJson(json);
}
