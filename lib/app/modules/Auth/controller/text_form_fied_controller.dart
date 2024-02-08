import 'package:get/get.dart';

class CustomTextFormFieldController extends GetxService {
  var isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
