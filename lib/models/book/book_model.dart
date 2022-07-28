import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    @Default('') String id,
    @Default('') String title,
    String? subTitle,
    @Default('') String description,
    @Default(0) int pageCount,
    @Default(0) double averageRating,
    @Default(0) int ratingsCount,
    @Default('') String imageLink,
    @Default(0) int view,

    @Default([]) List<AuthorModel> authorList,
    @Default([]) List<CategoryModel> categoryList,

    String? lastDay,
    int? lastPage,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
