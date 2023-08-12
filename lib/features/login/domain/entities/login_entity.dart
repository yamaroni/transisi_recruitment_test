import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transisi_recruitment_test/features/login/data/models/login_model.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  factory LoginEntity({
    required String email,
    required String password,
  }) = _LoginEntity;
}

extension LoginEntityX on LoginEntity {
  LoginModel toModel() => LoginModel(
    email: email,
    password: password,
  );
}