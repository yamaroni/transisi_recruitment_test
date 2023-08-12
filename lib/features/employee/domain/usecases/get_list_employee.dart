import 'package:dartz/dartz.dart';
import 'package:transisi_recruitment_test/features/employee/data/datasources/repositories/employee_repository.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

class GetListEmployee {
  final _repository = EmployeeRepositoryImpl();

  Future<Either<String, List<EmployeeEntity>>> call() {
    return _repository.getListEmployee();
  }
}