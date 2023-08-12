part of 'employee_bloc.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState({
    required Option<Either<String, Unit>> getAddStatus,
    required Option<Either<String, EmployeeEntity>> getDetailStatus,
    required Option<Either<String, List<EmployeeEntity>>> getListStatus,
    required Option<Either<String, Unit>> getUpdateStatus,
    required List<EmployeeEntity> listEmployee,
  }) = _EmployeeState;

  factory EmployeeState.initial() => EmployeeState(
    getAddStatus: none(),
    getDetailStatus: none(),
    getListStatus: none(),
    getUpdateStatus: none(),
    listEmployee: [],
  );
}
