import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi_recruitment_test/core/helpers/loading_helper.dart';
import 'package:transisi_recruitment_test/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:transisi_recruitment_test/features/employee/presentation/pages/employee_detail_page.dart';
import 'package:transisi_recruitment_test/features/employee/presentation/pages/employee_form_page.dart';
import 'package:transisi_recruitment_test/features/employee/presentation/widgets/employee_list_tile.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final _employeeBloc = EmployeeBloc();
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _employeeBloc.add(const EmployeeStarted());
    LoadingHelper.showLoading(
      text: 'Get Data',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _employeeBloc,
      listener: (context, EmployeeState state) {
        state.getListStatus.fold(
          () => null,
          (either) => either.fold((l) {
            LoadingHelper.dissmiss();
            LoadingHelper.showToast(
              text: l,
            );
          }, (r) => LoadingHelper.dissmiss()),
        );

        state.getDetailStatus.fold(
          () => null,
          (either) => either.fold(
            (l) {
              LoadingHelper.dissmiss();
              LoadingHelper.showToast(
                text: l,
              );
            },
            (value) {
              LoadingHelper.dissmiss();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeDetailPage(
                    avatar: value.avatar,
                    email: value.email,
                    fullname: value.fullname,
                    onEdited: () {
                      _emailController.value = TextEditingValue(
                        text: value.email,
                      );
                      _firstNameController.value = TextEditingValue(
                        text: value.firstName,
                      );
                      _lastNameController.value = TextEditingValue(
                        text: value.lastName,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeFormPage(
                            employee: value,
                            formKey: _formKey,
                            emailController: _emailController,
                            firstNameController: _firstNameController,
                            lastNameController: _lastNameController,
                            onSubmit: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_formKey.currentState!.validate()) {
                                _employeeBloc.add(
                                  EmployeeUpdated(
                                    id: value.id,
                                    email: _emailController.text,
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                  ),
                                );
                                LoadingHelper.showLoading(
                                  text: 'Send Data',
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );

        state.getAddStatus.fold(
          () => null,
          (either) => either.fold((l) {
            LoadingHelper.dissmiss();
            LoadingHelper.showToast(
              text: l,
            );
          }, (r) {
            LoadingHelper.dissmiss();
            LoadingHelper.showToast(
              text: 'Success Add Employee',
            );
          }),
        );

        state.getUpdateStatus.fold(
          () => null,
          (either) => either.fold((l) {
            LoadingHelper.dissmiss();
            LoadingHelper.showToast(
              text: l,
            );
          }, (r) {
            LoadingHelper.dissmiss();
            LoadingHelper.showToast(
              text: 'Success Update Employee',
            );
          }),
        );
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            title: Text(
              'List Employee',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.w,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: BlocBuilder(
              bloc: _employeeBloc,
              builder: (context, EmployeeState state) {
                return ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.listEmployee.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return EmployeeListTile(
                      index: index,
                      listEmployee: state.listEmployee,
                      onSelected: () {
                        _employeeBloc
                            .add(EmployeeSelected(state.listEmployee[index]));
                        LoadingHelper.showLoading(
                          text: 'Get Data',
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeFormPage(
                    formKey: _formKey,
                    emailController: _emailController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    onSubmit: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        _employeeBloc.add(
                          EmployeeAdded(
                            email: _emailController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                          ),
                        );
                        LoadingHelper.showLoading(
                          text: 'Send Data',
                        );
                        _emailController.clear();
                        _firstNameController.clear();
                        _lastNameController.clear();
                      }
                    },
                  ),
                ),
              );
            },
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32.w,
            ),
          ),
        ),
      ),
    );
  }
}
