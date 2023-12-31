import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/services/firebase/auth.dart';

class SignUpController extends GetxController {
  final emailC = TextEditingController();
  final nameC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  register() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      var success = await AuthService.register(
        emailC.text,
        passwordC.text,
      );
      isLoading.value = false;
      if (success) {
        _clearForm();
        Get.back();
      }
    }
  }

  _clearForm() {
    emailC.clear();
    nameC.clear();
    passwordC.clear();
    confirmC.clear();
  }
}
