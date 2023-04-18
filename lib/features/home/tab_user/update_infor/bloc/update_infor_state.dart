part of 'update_infor_bloc.dart';

@Freezed(
  fromJson: false,
)
class UpdateInforState with _$UpdateInforState {
  const factory UpdateInforState({
    @Default(UserModel()) UserModel user,
  }) = _UpdateInforState;
}
