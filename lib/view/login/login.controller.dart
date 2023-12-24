import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/routes/app_pages.dart';
import 'package:my_pos_que/services/firebase/auth.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      var credential = await AuthService.login(
        emailC.text,
        passwordC.text,
      );
      if (credential != null) {
        Get.toNamed(Routes.home);
        emailC.clear();
        passwordC.clear();
      }
      isLoading.value = false;
    }
  }

  forgotPw() {}

  signUp() => Get.toNamed(Routes.signup);
}
