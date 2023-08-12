import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/data/repositories/employee_repository.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

class GetDetailEmployee {
  final _repository = EmployeeRepositoryImpl();

  Future<Either<String, EmployeeEntity>> call({
    required EmployeeEntity employee,
  }) {
    return _repository.getDetailEmployee(employee);
  }
}