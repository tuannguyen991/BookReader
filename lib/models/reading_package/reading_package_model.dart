import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_package_model.freezed.dart';
part 'reading_package_model.g.dart';

@freezed
class ReadingPackageModel with _$ReadingPackageModel {
  const factory ReadingPackageModel({
    @Default('') String id,
    @Default('') String name,
    @Default(1) int duration,
    @Default(0) int price,
    @Default(0)int discountPercentage
}) = _ReadingPackageModel;

  factory ReadingPackageModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingPackageModelFromJson(json);
}
