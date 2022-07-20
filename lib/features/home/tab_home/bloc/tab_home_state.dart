part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
  equal: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    @Default([])
        List<BookModel> recommendedBooks,

    @Default(BookModel(
      authorName: '',
      categoryName: '',
      decription: '',
      id: 0,
      image: '',
      name: '',
      numberPage: 0,
      ratingCount: 0,
      ratingTotal: 0,
    ))
        BookModel bookItem,
        
  }) = _TabHomeState;
}
