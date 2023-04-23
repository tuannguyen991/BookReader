import 'package:demo_book_reader/share/functions/util_func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_package_model.freezed.dart';

part 'reading_package_model.g.dart';

@freezed
class ReadingPackageModel with _$ReadingPackageModel {
  const factory ReadingPackageModel(
      {@Default('') String id,
      @Default('') String name,
      @Default(Duration(days: 0)) Duration duration,
      @Default(0) int price,
      @Default(1) int currency,
      @Default(0) int discountPercentage}) = _ReadingPackageModel;

  factory ReadingPackageModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingPackageModelFromJson(json);
}
