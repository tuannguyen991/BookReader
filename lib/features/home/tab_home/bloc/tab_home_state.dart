part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
  equal: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    @Default([]) List<BookModel> recommendedBooks,
    @Default(0) int indexCarousel,
    // @Default(false) bool isLoading,
  }) = _TabHomeState;
}