part of 'user_reading_package_bloc.dart';

@Freezed(
  fromJson: false,
)
class UserReadingPackageState with _$UserReadingPackageState {
  const factory UserReadingPackageState({
    @Default(true) bool isLoading,
    @Default([ReadingPackageModel()])
        List<ReadingPackageModel> readingPackageList,
    DetailCurrentPackage? currentPackage,
  }) = _UserReadingPackageState;
}
