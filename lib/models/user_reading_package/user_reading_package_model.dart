import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_reading_package_model.freezed.dart';
part 'user_reading_package_model.g.dart';

@freezed
class UserReadingPackageModel with _$UserReadingPackageModel {
  const factory UserReadingPackageModel({
    @Default(ReadingPackageModel()) ReadingPackageModel readingPackage,
    DateTime? startDate,
  }) = _UserReadingPackageModel;

  factory UserReadingPackageModel.fromJson(Map<String, Object?> json) =>
      _$UserReadingPackageModelFromJson(json);
}