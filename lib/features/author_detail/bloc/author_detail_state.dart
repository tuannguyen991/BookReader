part of 'author_detail_bloc.dart';

@Freezed(
  fromJson: false,
)
class AuthorDetailState with _$AuthorDetailState {
  const factory AuthorDetailState({
    @Default([]) List<UserBookModel> books,
  }) = _AuthorDetailState;
}
