part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required Option<Either<String, Unit>> loginStatus,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    loginStatus: none(),
  );
}
