import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/enum/action_dialog.enum.dart';
import 'package:my_pos_que/helper/dialog.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<UserCredential?> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = credential.user!;
      if (!user.emailVerified) {
        showActionDialog(
          "Email yang Anda masukan belum melakukan verifikasi. Verifikasi sekarang ?",
          actionDialog: ActionDialog.confirm,
          onConfrimYes: () => {
            Get.back(),
            _verificationEmail(
              credential,
              "Kami telah mengirim email verifikasi ke ${credential.user?.email}.",
            ),
          },
        );
        return null;
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showActionDialog(
          "Pengguna dengan email tersebut tidak ditemukan.",
          actionDialog: ActionDialog.warning,
        );
      } else if (e.code == 'wrong-password') {
        showActionDialog(
          "Kata sandi yang anda masukan salah",
          actionDialog: ActionDialog.warning,
        );
      } else {
        showActionDialog(
          e.message!,
          actionDialog: ActionDialog.warning,
        );
      }
      return null;
    }
  }

  static Future<bool> register(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _verificationEmail(
        credential,
        "Registrasi berhasil!. Kami telah mengirim email verifikasi ke ${credential.user?.email}",
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showActionDialog(
          "Kata sandi yang diberikan terlalu lemah.",
          actionDialog: ActionDialog.warning,
        );
      } else if (e.code == 'email-already-in-use') {
        showActionDialog(
          "Email yang Anda masukan sudah terdaftar.",
          actionDialog: ActionDialog.warning,
        );
      }
    } catch (e) {
      requestErrorDialog();
    }
    return false;
  }

  static _verificationEmail(UserCredential credential, String message) async {
    try {
      var user = credential.user!;
      await user.sendEmailVerification();
      showActionDialog(
        message,
        actionDialog: ActionDialog.success,
      );
    } catch (e) {
      requestErrorDialog();
    }
  }
}
