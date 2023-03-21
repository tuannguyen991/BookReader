part of 'user_reading_package_bloc.dart';

@Freezed(
  fromJson: false,
)
class UserReadingPackageState with _$UserReadingPackageState {
  const factory UserReadingPackageState({
    @Default(true) bool isLoading,
    @Default(UserReadingPackageModel()) UserReadingPackageModel userReadingPackage,
    @Default([ReadingPackageModel()]) List<ReadingPackageModel> readingPackageList,
}) = _UserReadingPackageState;
}