import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:transisi_recruitment_test/core/constants/assets_constant_name.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isObscureText;
  final GlobalKey formKey;
  final Function()? onSubmit;
  const LoginForm({super.key,
    required this.emailController,
    required this.passwordController,
    required this.isObscureText,
    required this.formKey,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsName.transisiLogo,
          ),
          SizedBox(height: 8.w),
          Text(
            'Welcome Back',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.w,
            ),
          ),
          SizedBox(height: 8.w),
          TextFormField(
            controller: emailController,
            autofocus: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some email';
              }
              return null;
            },
          ),
          ValueListenableBuilder(
            valueListenable: isObscureText,
            builder: (context, value, child) {
              return TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  icon: const Icon(Icons.password),
                  hintText: 'Password',
                  suffixIcon: InkWell(
                    onTap: () => isObscureText.value = !isObscureText.value,
                    child: isObscureText.value
                        ? const Icon(Symbols.visibility)
                        : const Icon(Symbols.visibility_off),
                  ),
                ),
                obscureText: isObscureText.value,
                textInputAction: TextInputAction.done,
              );
            },
          ),
          SizedBox(height: 32.w),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onSubmit,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.w),
        ],
      ),
    );
  }
}