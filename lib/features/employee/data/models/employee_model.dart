import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  @JsonSerializable(explicitToJson: true)
  factory EmployeeModel({
    int? id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? avatar,
  }) = _EmployeeModel;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);
}

extension EmployeeModelX on EmployeeModel {
  EmployeeEntity toDomain() => EmployeeEntity(
    id: id.toString(),
    email: email ?? 'example@email.com',
    firstName: firstName ?? '',
    lastName: lastName ?? '',
    fullname: '${firstName ?? ''} ${lastName ?? ''}',
    avatar: avatar ?? '',
  );
}