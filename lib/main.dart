import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi_recruitment_test/config.dart';
import 'package:transisi_recruitment_test/features/login/presentation/pages/login_page.dart';

void main() async {
  await Config.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: child,
          builder: EasyLoading.init(),
        );
      },
      child: const LoginPage(),
    );
  }
}