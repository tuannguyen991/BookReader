part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    //
    @Default([])
        List<BookModel> recommendedBooks,
    //
    @Default(
      BookModel(
        id: '',
        title: '',
        description: '',
        pageCount: 0,
        averageRating: 0,
        ratingsCount: 0,
        imageLink: '',
        view: 0,

        // will remove
        authorList: [],
        categoryList: [],
      ),
    )
        BookModel bookItem,
    //
    @Default('')
        String firstName,
    //
    @Default(
      BookModel(
        id: '',
        title: '',
        description: '',
        pageCount: 0,
        averageRating: 0,
        ratingsCount: 0,
        imageLink: '',
        view: 0,

        // will remove
        authorList: [],
        categoryList: [],
      ),
    )
        BookModel lastBook,
    //
    @Default(true)
        bool isLoading,
  }) = _TabHomeState;
}
