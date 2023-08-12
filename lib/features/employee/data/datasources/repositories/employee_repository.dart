import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/data/datasources/remote/employee_datasource_remote.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';
import 'package:transisi_recruitment_test/features/employee/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository{
  final _dataSourceRemote = EmployeeDataSourceRemoteImpl();

  @override
  Future<Either<String, EmployeeEntity>> getDetailEmployee(EmployeeEntity employee) {
    return _dataSourceRemote.getDetailEmployee(employee.id);
  }

  @override
  Future<Either<String, List<EmployeeEntity>>> getListEmployee() {
    return _dataSourceRemote.getListEmployee();
  }

  @override
  Future<Either<String, Unit>> addEmployee({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    return _dataSourceRemote.addEmployee(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
  
  @override
  Future<Either<String, Unit>> updateEmployee({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    return _dataSourceRemote.updateEmployee(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}