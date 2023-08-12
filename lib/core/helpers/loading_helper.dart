import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:transisi_recruitment_test/core/helpers/global_helper.dart';

class LoadingHelper {
  
  static void showLoading({
    String? text,
  }) {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
    EasyLoading.show(
      status: text,
    );
  }

  static void showToast({
    String? text,
  }) {
    if (!GlobalHelper.isEmpty(text)) {
      EasyLoading.showToast(
        text!,
        duration: const Duration(seconds: 3),
        toastPosition: EasyLoadingToastPosition.bottom,
      );
    }
  }

  static void dissmiss() {
    EasyLoading.dismiss();
  }
}