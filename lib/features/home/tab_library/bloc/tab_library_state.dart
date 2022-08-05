part of 'tab_library_bloc.dart';

@Freezed(
  fromJson: false,
) 
class TabLibraryState with _$TabLibraryState {
  const factory TabLibraryState({
    @Default(true) bool isLoading,
    @Default(0) int indexChoice,
    @Default([]) List<BookModel> favoriteBooks,
    @Default([]) List<BookModel> readBooks,
    @Default([]) List<BookModel> uploadBooks,
    @Default(false) bool isGridShow,

    // just test
    @Default('') String url,
  }) = _TabLibraryState;
}
