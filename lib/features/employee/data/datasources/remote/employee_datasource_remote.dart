import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:transisi_recruitment_test/core/constants/url_constant_name.dart';
import 'package:transisi_recruitment_test/core/helpers/dio_helper.dart';
import 'package:transisi_recruitment_test/features/employee/data/models/employee_model.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

abstract class EmployeeDataSourceRemote {
  Future<Either<String, EmployeeEntity>> getDetailEmployee(String id);
  Future<Either<String, List<EmployeeEntity>>> getListEmployee();
  Future<Either<String, Unit>> addEmployee({
    required String firstName,
    required String lastName,
    required String email,
  });
  Future<Either<String, Unit>> updateEmployee({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  });
}

class EmployeeDataSourceRemoteImpl implements EmployeeDataSourceRemote {
  @override
  Future<Either<String, EmployeeEntity>> getDetailEmployee(String id) async {
    try {
      final response = await DioHelper.dio?.get(
        '${UrlName.baseUrl}${UrlName.userPath}/$id');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final result = response?.data['data'];
        return Right(EmployeeModel.fromJson(result).toDomain());
      } else {
        return const Left('Failed get response!');
      }
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<EmployeeEntity>>> getListEmployee() async {
    try {
      final response = await DioHelper.dio?.get(UrlName.baseUrl + UrlName.userPath);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final result = response?.data['data'];
        return Right(List.generate(
          result.length, (index) => EmployeeModel.fromJson(
            result[index]).toDomain()));
      } else {
        return const Left('Failed get response!');
      }
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> addEmployee({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      final response = await DioHelper.dio?.post(UrlName.baseUrl + UrlName.userPath,
        data: EmployeeModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),
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

  @override
  Future<Either<String, Unit>> updateEmployee({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      final response = await DioHelper.dio?.put('${UrlName.baseUrl}${UrlName.userPath}/$id',
        data: EmployeeModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),
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