import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi_recruitment_test/core/helpers/loading_helper.dart';
import 'package:transisi_recruitment_test/features/employee/presentation/pages/employee_page.dart';
import 'package:transisi_recruitment_test/features/login/presentation/bloc/login_bloc.dart';
import 'package:transisi_recruitment_test/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _isObscureText = ValueNotifier(true);
  final _formKey = GlobalKey<FormState>();
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (context, LoginState state) {
        state.loginStatus.fold(
          () => null,
          (either) => either.fold(
            (l) {
              LoadingHelper.dissmiss();
              LoadingHelper.showToast(
                text: l,
              );
            },
            (r) {
              LoadingHelper.dissmiss();
              _emailController.clear();
              _passwordController.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmployeePage(),
                ),
              );
            },
          ),
        );
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: Center(
            child: Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Colors.white,
              ),
              child: LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
                isObscureText: _isObscureText,
                formKey: _formKey,
                onSubmit: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (_formKey.currentState!.validate()) {
                    LoadingHelper.showLoading(
                      text: 'Send Data',
                    );
                    _loginBloc.add(
                      FormSubmitted(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
