import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:transisi_recruitment_test/core/constants/url_constant_name.dart';
import 'package:transisi_recruitment_test/core/helpers/dio_helper.dart';
import 'package:transisi_recruitment_test/features/login/data/models/login_model.dart';

abstract class LoginDatasourceRemote {
  Future<Either<String, Unit>> submitLogin(LoginModel loginModel);
}

class LoginDatasourceRemoteImpl implements LoginDatasourceRemote {
  @override
  Future<Either<String, Unit>> submitLogin(LoginModel loginModel) async {
    try {
      final response = await DioHelper.dio?.post(UrlName.baseUrl + UrlName.loginPath,
        data: loginModel,
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return const Right(unit);
      } else {
        return const Left('Failed get response!');
      }
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

}