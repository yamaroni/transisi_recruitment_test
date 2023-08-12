import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/data/datasources/repositories/employee_repository.dart';

class UpdateEmployee {
  final _repository = EmployeeRepositoryImpl();

  Future<Either<String, Unit>> call({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) {
    return _repository.updateEmployee(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}