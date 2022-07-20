part of 'authors_bloc.dart';

@Freezed(
  fromJson: false,
  equal: false,
)
class AuthorsState with _$AuthorsState {
  const factory AuthorsState({
    @Default([]) List<AuthorModel> authors,
    @Default(false) bool isLoading,
  }) = _AuthorsState;
}