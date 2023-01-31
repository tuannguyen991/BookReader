import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_book_model.freezed.dart';
part 'user_book_model.g.dart';

@freezed
class UserBookModel with _$UserBookModel {
  const factory UserBookModel(
      {@Default('')
          String bookId,
      @Default(0)
          int numberOfReadPages,
      DateTime? lastRead,
      @Default(0)
          double rating,
      @Default('No title')
          String title,
      String? subTitle,
      @Default(0)
          int numberOfPages,
      @Default('')
          String epubLink,
      @Default('https://www.dropbox.com/s/jcaex2p7zxcj8vf/default.jpg?raw=1')
          String imageLink,
      @Default(0)
          double averageRating,
      @Default('No description')
          String description,
      @Default([])
          List<AuthorModel> authors,
      @Default([])
          List<CategoryModel> categories}) = _UserBookModel;

  factory UserBookModel.fromJson(Map<String, Object?> json) =>
      _$UserBookModelFromJson(json);

  factory UserBookModel.fromBookModel(BookModel bookModel) {
    return UserBookModel(
      authors: bookModel.authors,
      averageRating: bookModel.averageRating,
      bookId: bookModel.id,
      categories: bookModel.categories,
      description: bookModel.description,
      epubLink: bookModel.epubLink,
      imageLink: bookModel.imageLink,
      numberOfPages: bookModel.numberOfPages,
      title: bookModel.title,
      subTitle: bookModel.subTitle,
      rating: 0,
      numberOfReadPages: 0,
    );
  }
}
