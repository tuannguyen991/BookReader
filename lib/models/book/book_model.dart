import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required String id,
    required String title,
    String? subTitle,
    required String description,
    required int pageCount,
    required double averageRating,
    required int ratingsCount,
    required String imageLink,
    required int view,

    required List<AuthorModel> authorList,
    required List<CategoryModel> categoryList,

    String? lastDay,
    int? lastPage,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
