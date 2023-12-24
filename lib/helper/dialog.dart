import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/enum/action_dialog.enum.dart';
import 'package:my_pos_que/widget/app_action_dialog.dart';
import 'package:my_pos_que/widget/app_loading_dialog.dart';

waitingDialog({String? message}) {
  return Get.dialog(
    AppLoadingDialog(message: message),
    barrierDismissible: false,
  );
}

showDialogCustom(Widget content) async {
  await Get.dialog(
    transitionCurve: Curves.easeIn,
    AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      actionsPadding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 18.0),
      content: content,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
  );
}

showActionDialog(
  String message, {
  ActionDialog actionDialog = ActionDialog.confirm,
  Function()? onConfrimYes,
}) async {
  await showDialogCustom(
    AppDialogAction(
      actionDialog: actionDialog,
      message: message,
      onConfrimYes: onConfrimYes,
    ),
  );
}

requestErrorDialog() {
  return showActionDialog(
    "Oops, terjadi kesalahan. Tidak dapat mengirimkan permintaan",
    actionDialog: ActionDialog.failed,
  );
}

showBottomBar(Widget content) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: Get.context!,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) => content,
  );
}
