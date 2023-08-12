import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/login/data/datasources/remote/login_datasource_remote.dart';
import 'package:transisi_recruitment_test/features/login/domain/entities/login_entity.dart';
import 'package:transisi_recruitment_test/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final _datasourceRemote = LoginDatasourceRemoteImpl();

  @override
  Future<Either<String, Unit>> submitLogin(LoginEntity loginEntity) async {
    return _datasourceRemote.submitLogin(loginEntity.toModel());
  }
}