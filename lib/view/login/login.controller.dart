import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final isLoading = false.obs;

  login() async {
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 2000));
    isLoading.value = false;
  }

  forgotPw() {}
  signUp() {}
}
