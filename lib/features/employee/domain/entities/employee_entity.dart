import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_entity.freezed.dart';

@freezed
class EmployeeEntity with _$EmployeeEntity {
  factory EmployeeEntity({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String fullname,
    required String avatar,
  }) = _EmployeeEntity;
}