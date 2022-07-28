import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  // In order to appropriately override the toString method, we need to declare an named private constructor with the use of
  const CategoryModel._();

  const factory CategoryModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String imageLink,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);

  @override
  String toString() {
    return name;
  }
}
