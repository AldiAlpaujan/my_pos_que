import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final isLoading = false.obs;

  login() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.toNamed(Routes.home);
    isLoading.value = false;
  }

  forgotPw() {}

  signUp() => Get.toNamed(Routes.signup);
}
