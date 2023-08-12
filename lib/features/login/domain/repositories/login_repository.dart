import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<String, Unit>> submitLogin(LoginEntity loginEntity);
}