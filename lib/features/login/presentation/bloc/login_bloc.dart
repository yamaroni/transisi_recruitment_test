import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transisi_recruitment_test/features/login/domain/usecases/submit_login.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onFormSubmitted(FormSubmitted event, emit) async {
    final submitLogin = SubmitLogin();
    final result = await submitLogin.call(
      email: event.email,
      password: event.password,
    );
    emit(state.copyWith(loginStatus: optionOf(result)));
    emit(state.copyWith(loginStatus: none()));
  }
}
