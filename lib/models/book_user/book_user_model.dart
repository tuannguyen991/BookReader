import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_user_model.freezed.dart';
part 'book_user_model.g.dart';

@freezed
class BookUserModel with _$BookUserModel {
  const factory BookUserModel({
    required int id,
    required String name,
    required String decription,
    required double ratingTotal,
    required double ratingCount,
    required int numberPage,
    required String image,
    required String authorName,
    required String categoryName,

    required String lastDay,
    required String lastPage,
  }) = _BookUserModel;

  factory BookUserModel.fromJson(Map<String, Object?> json) =>
      _$BookUserModelFromJson(json);
}
