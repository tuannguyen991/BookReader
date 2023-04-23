part of 'library_upload_bloc.dart';

@Freezed(
  fromJson: false,
)
class LibraryUploadState with _$LibraryUploadState {
  const factory LibraryUploadState({
    @Default(true) bool isLoading,
    @Default([]) List<CategoryModel> categories,
    @Default(BookModel()) BookModel bookItem,
  }) = _LibraryUploadState;
}
