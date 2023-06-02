import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:demo_book_reader/models/user_book/user_library/user_library_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_book_model.freezed.dart';
part 'user_book_model.g.dart';

@freezed
class UserBookModel with _$UserBookModel {
  const factory UserBookModel({
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
    UserLibraryModel? userLibrary,
  }) = _UserBookModel;

  factory UserBookModel.fromJson(Map<String, Object?> json) =>
      _$UserBookModelFromJson(json);
}
