import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

abstract class EmployeeRepository {
  Future<Either<String, EmployeeEntity>> getDetailEmployee(EmployeeEntity employee);
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