import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_pos_que/helper/validator.dart';
import 'package:my_pos_que/theme/theme.dart';
import 'package:my_pos_que/view/signup/signup.controller.dart';
import 'package:my_pos_que/widget/app_button.dart';

import '../../helper/assets.dart';
import '../../widget/app_auth_text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = AppTheme.mobilePadding;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 8, top: padding),
                      color: Colors.red.withOpacity(.0),
                      child: SvgPicture.asset(signupIllus),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 28,
                        color: AppTheme.bodyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Mari bergabung besama kami!",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.capColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: AppAuthTextField(
                      hintText: "Masukkan email",
                      icon: MdiIcons.at,
                      controller: controller.emailC,
                      validator: (v) => emailValidator(v!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: AppAuthTextField(
                      hintText: "Masukkan nama lengkap",
                      icon: MdiIcons.accountOutline,
                      controller: controller.nameC,
                      validator: (v) => emptyValidator("Nama", v!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: AppAuthTextField(
                      hintText: "Masukkan password",
                      icon: MdiIcons.lockOutline,
                      controller: controller.passwordC,
                      obscureText: true,
                      validator: (v) => pwValidator(v!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: AppAuthTextField(
                      hintText: "Masukkan konfirmasi password",
                      icon: MdiIcons.lockAlertOutline,
                      controller: controller.confirmC,
                      obscureText: true,
                      validator: (v) => pwConfirmValidator(
                        controller.passwordC.text,
                        v!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Obx(
                      () => AppButton(
                        label: "Continue",
                        width: double.infinity,
                        onPressed: controller.register,
                        isLoading: controller.isLoading.value,
                      ),
                    ),
                  ),
                  login(),
                  const SizedBox(height: padding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget login() => Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            text: "Sudah punya akun ?  ",
            style: const TextStyle(color: AppTheme.capColor),
            children: [
              TextSpan(
                text: "Login",
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
}
