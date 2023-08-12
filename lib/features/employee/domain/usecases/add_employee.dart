import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/data/repositories/employee_repository.dart';

class AddEmployee {
  final _repository = EmployeeRepositoryImpl();

  Future<Either<String, Unit>> call({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    return _repository.addEmployee(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}