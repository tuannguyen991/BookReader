import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required int id,
    required String name,
    required String decription,
    required double ratingTotal,
    required double ratingCount,
    required int numberPage,
    required String image,

    required String authorName,
    required String categoryName,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
