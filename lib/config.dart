import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_recruitment_test/core/constants/url_constant_name.dart';
import 'package:transisi_recruitment_test/core/helpers/dio_helper.dart';
import 'package:transisi_recruitment_test/core/loggers/bloc_event_logger.dart';

class Config {
  const Config._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    DioHelper.initialDio(UrlName.baseUrl);
    DioHelper.setDioLogger(UrlName.baseUrl);

    Bloc.observer = BlocEventLogger();
  }
}