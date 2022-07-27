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
        authorList: [],
        categoryList: [],
      ),
    )
        BookModel bookItem,
    //
    @Default(
      UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        password: '',
        email: '',
        phone: '',
        age: -1,
        gender: false,
        imageLink: '',
        imagaLinkRanking: '',
        readingTime: 0,
        readBooks: 0,
      ),
    )
        UserModel user,
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
