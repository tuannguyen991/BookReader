part of 'authors_bloc.dart';

@Freezed(fromJson: false)
class AuthorsState with _$AuthorsState {
  const factory AuthorsState({
    @Default([]) List<AuthorModel> authors,
  }) = _AuthorsState;
}
