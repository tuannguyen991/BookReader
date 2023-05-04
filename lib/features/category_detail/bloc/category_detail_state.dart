part of 'category_detail_bloc.dart';

@Freezed(
  fromJson: false,
)
class CategoryDetailState with _$CategoryDetailState {
  const factory CategoryDetailState({
    @Default([]) List<UserBookModel> books,
  }) = _CategoryDetailState;
}
