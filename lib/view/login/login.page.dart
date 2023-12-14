import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_pos_que/helper/assets.dart';
import 'package:my_pos_que/theme/theme.dart';
import 'package:my_pos_que/widget/app_auth_text_field.dart';
import 'package:my_pos_que/widget/app_button.dart';

import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = AppTheme.mobilePadding;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 230,
                    height: 230,
                    margin: const EdgeInsets.only(bottom: 20, top: padding),
                    color: Colors.red.withOpacity(.0),
                    child: SvgPicture.asset(
                      loginIllus,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      color: AppTheme.bodyColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Masukkan email dan password Anda untuk melanjutkan",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.capColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AppAuthTextField(
                    hintText: "Masukkan email",
                    icon: MdiIcons.at,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: AppAuthTextField(
                    hintText: "Masukkan password",
                    icon: MdiIcons.lockOutline,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: forgotPassword(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Obx(
                    () => AppButton(
                      label: "Login",
                      width: double.infinity,
                      isLoading: controller.isLoading.value,
                      onPressed: controller.login,
                    ),
                  ),
                ),
                signUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: controller.forgotPw,
          child: const SizedBox(
            height: 28,
            child: Text(
              "Lupa Password?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      );

  Widget signUp() => Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            text: "Belum Punya Akun?  ",
            style: const TextStyle(color: AppTheme.capColor),
            children: [
              TextSpan(
                text: "Daftar Sekarang!",
                recognizer: TapGestureRecognizer()..onTap = controller.signUp,
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
