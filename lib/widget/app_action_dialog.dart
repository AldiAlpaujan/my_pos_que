import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/enum/action_dialog.enum.dart';
import 'package:my_pos_que/helper/assets.dart';
import 'package:my_pos_que/helper/global_style.dart';
import 'package:my_pos_que/theme/theme.dart';
import 'package:my_pos_que/widget/app_dialog_button.dart';

class AppDialogAction extends StatelessWidget {
  final String message;
  final ActionDialog actionDialog;
  final Function()? onConfrimYes;
  const AppDialogAction({
    super.key,
    required this.actionDialog,
    required this.message,
    this.onConfrimYes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * .5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SvgPicture.asset(
                getIcon(),
                height: 58,
                width: 58,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                getTitleCap(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.bodyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.capColor,
                ),
              ),
            ),
            getButton(onConfrimYes),
          ],
        ),
      ),
    );
  }

  String getTitleCap() {
    switch (actionDialog) {
      case ActionDialog.failed:
        return "Gagal";
      case ActionDialog.confirm:
        return "Konfirmasi";
      case ActionDialog.warning:
        return "Warning";
      default:
        return "Berhasil";
    }
  }

  String getIcon() {
    switch (actionDialog) {
      case ActionDialog.failed:
        return ilusDialogFailed;
      case ActionDialog.confirm:
        return ilusDialogWarning;
      case ActionDialog.warning:
        return ilusDialogWarning;
      default:
        return ilusDialogSucces;
    }
  }

  Widget getButton(Function()? onConfrimYes) {
    switch (actionDialog) {
      case ActionDialog.failed:
        return button(
          "Coba lagi",
          const Color(0xFFFC6464),
          const Color.fromRGBO(252, 100, 100, 0.20),
          onTap: Get.back,
        );
      case ActionDialog.confirm:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: button(
                "batal",
                const Color(0xFFFF9046),
                const Color.fromARGB(51, 252, 186, 100),
                onTap: Get.back,
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 100,
              child: button(
                "Iya",
                const Color(0xFFFF9046),
                const Color.fromARGB(51, 252, 186, 100),
                onTap: () {
                  if (onConfrimYes != null) onConfrimYes();
                },
              ),
            ),
          ],
        );
      case ActionDialog.warning:
        return button(
          "Iya",
          const Color(0xFFFF9046),
          const Color.fromARGB(51, 252, 186, 100),
          onTap: Get.back,
        );
      default:
        return button(
          "Lanjutkan",
          const Color(0xFF6AB058),
          const Color.fromRGBO(106, 176, 88, 0.20),
          onTap: Get.back,
        );
    }
  }

  Widget button(
    String label,
    Color colorBtn,
    Color shadow, {
    Function()? onTap,
  }) {
    return AppDialogButton(
      label: label,
      colorBtn: colorBtn,
      shadow: shadow,
      onTap: onTap,
    );
  }
}
