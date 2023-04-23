part of 'home_search_bloc.dart';

@Freezed(
  fromJson: false,
)
class HomeSearchState with _$HomeSearchState {
  const factory HomeSearchState({
    @Default(true) bool isLoading,
    @Default([]) List<String> history,
    @Default([]) List<CategoryModel> listCategory,
    @Default([]) List<BookModel> listBook,
    @Default([]) List<AuthorModel> listAuthor,
    @Default([]) List<dynamic> listRecommendedByName,
  }) = _HomeSearchState;
}
