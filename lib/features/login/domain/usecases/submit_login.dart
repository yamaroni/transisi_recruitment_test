import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/login/data/repositories/login_repository.dart';
import 'package:transisi_recruitment_test/features/login/domain/entities/login_entity.dart';

class SubmitLogin {
  final _repository = LoginRepositoryImpl();

  Future<Either<String, Unit>> call({
    String? email,
    String? password,
  }) async {
    return _repository.submitLogin(
      LoginEntity(
        email: email ?? '',
        password: password ?? '',
      ),
    );
  }
}