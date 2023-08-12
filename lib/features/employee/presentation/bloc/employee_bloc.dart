import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';
import 'package:transisi_recruitment_test/features/employee/domain/usecases/add_employee.dart';
import 'package:transisi_recruitment_test/features/employee/domain/usecases/get_detail_employee.dart';
import 'package:transisi_recruitment_test/features/employee/domain/usecases/get_list_employee.dart';
import 'package:transisi_recruitment_test/features/employee/domain/usecases/update_employee.dart';

part 'employee_event.dart';
part 'employee_state.dart';
part 'employee_bloc.freezed.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeState.initial()) {
    on<EmployeeStarted>(_onEmployeeStarted);
    on<EmployeeSelected>(_onEmployeeSelected);
    on<EmployeeAdded>(_onEmployeeAdded);
    on<EmployeeUpdated>(_onEmployeeUpdated);
  }

  Future<void> _onEmployeeStarted(EmployeeStarted event, emit) async {
    final getListEmployee = GetListEmployee();
    final result = await getListEmployee.call();
    emit(state.copyWith(
      getListStatus: optionOf(result),
      listEmployee: result.getOrElse(() => []),
    ));
    emit(state.copyWith(getListStatus: none()));
  }

  Future<void> _onEmployeeSelected(EmployeeSelected event, emit) async {
    final getDetailEmployee = GetDetailEmployee();
    final result = await getDetailEmployee.call(
      employee: event.employee,
    );
    emit(state.copyWith(getDetailStatus: optionOf(result)));
    emit(state.copyWith(getDetailStatus: none()));
  }

  Future<void> _onEmployeeAdded(EmployeeAdded event, emit) async {
    final addEmployee = AddEmployee();
    final result = await addEmployee.call(
      email: event.email,
      firstName: event.firstName,
      lastName: event.lastName,
    );
    emit(state.copyWith(getAddStatus: optionOf(result)));
    emit(state.copyWith(getAddStatus: none()));
  }
  
  Future<void> _onEmployeeUpdated(EmployeeUpdated event, emit) async {
    final updateEmployee = UpdateEmployee();
    final result = await updateEmployee.call(
      id: event.id,
      email: event.email,
      firstName: event.firstName,
      lastName: event.lastName,
    );
    emit(state.copyWith(getUpdateStatus: optionOf(result)));
    emit(state.copyWith(getUpdateStatus: none()));
  }
}
