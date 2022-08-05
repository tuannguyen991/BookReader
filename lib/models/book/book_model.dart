import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    @Default('')
        String id,
    @Default('No title')
        String title,
    String? subTitle,
    @Default('No description')
        String description,
    @Default(0)
        int pageCount,
    @Default(0)
        double averageRating,
    @Default(0)
        int ratingsCount,
    @Default('https://truyentr.org/assets/images/default.jpg')
        String imageLink,
    @Default(0)
        int view,
    @Default([])
    // ignore: invalid_annotation_target
    @JsonKey(
      // fromJson: BookModel._AuthorModelFromJson,
      toJson: BookModel._authorListToJson,
    )
        List<AuthorModel> authorList,
    @Default([])
        List<CategoryModel> categoryList,
    String? lastDay,
    int? lastPage,
    @Default(false)
        bool isFile,
  }) = _BookModel;

  static List<Map<String, dynamic>>? _authorListToJson(List<AuthorModel>? authorList) {
    // if (authorList == null) return null;

    return authorList!.map((e) => e.toJson()).toList();
  }

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
