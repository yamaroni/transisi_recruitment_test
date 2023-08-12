import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:transisi_recruitment_test/core/helpers/global_helper.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

class EmployeeFormPage extends StatelessWidget {
  final EmployeeEntity? employee;
  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final Function()? onSubmit;
  const EmployeeFormPage({
    super.key,
    this.employee,
    required this.formKey,
    required this.emailController,
    required this.firstNameController,
    required this.lastNameController,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            emailController.clear();
            firstNameController.clear();
            lastNameController.clear();
          },
          child: Icon(
            Symbols.close,
            size: 24.w,
            color: Colors.white,
          ),
        ),
        title: Text(
          GlobalHelper.isEmpty(employee)
              ? 'Add Employee'
              : 'Edit Employee',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.w,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16.w,
            ),
            child: InkWell(
              onTap: onSubmit,
              child: Icon(
                Symbols.save,
                size: 24.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              children: [
                SizedBox(height: 16.w),
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Symbols.person),
                    hintText: 'First Name',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.w),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Symbols.person_add),
                    hintText: 'Last Name',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.w),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Email',
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some email';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}