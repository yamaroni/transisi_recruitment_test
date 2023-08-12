part of 'employee_bloc.dart';

@freezed
class EmployeeEvent with _$EmployeeEvent {
  const factory EmployeeEvent.started() = EmployeeStarted;
  const factory EmployeeEvent.selected(EmployeeEntity employee) = EmployeeSelected;
  const factory EmployeeEvent.added({
    required String firstName,
    required String lastName,
    required String email,
  }) = EmployeeAdded;
  const factory EmployeeEvent.updated({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = EmployeeUpdated;
}