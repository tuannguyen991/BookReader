import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    @Default('') String id,
    @Default('No title') String title,
    String? subTitle,
    @Default(0) int numberOfPages,
    @Default('') String epubLink,
    @Default('https://www.dropbox.com/s/jcaex2p7zxcj8vf/default.jpg?raw=1')
        String imageLink,
    @Default(0) double averageRating,
    @Default('No description') String description,
    @Default([]) List<AuthorModel> authors,
    @Default([]) List<CategoryModel> categories,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
