import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_library_model.freezed.dart';
part 'user_library_model.g.dart';

@freezed
class UserLibraryModel with _$UserLibraryModel {
  const factory UserLibraryModel({
    @Default(false) bool isFavorite,
    @Default(false) bool isReading,
    @Default(0) int numberOfReadPages,
    @Default(0) double rating,
    DateTime? lastRead,
    @Default('') String lastLocator,
    @Default('') String href,
  }) = _UserLibraryModel;

  factory UserLibraryModel.fromJson(Map<String, Object?> json) =>
      _$UserLibraryModelFromJson(json);
}
